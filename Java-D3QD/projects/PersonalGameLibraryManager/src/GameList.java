package PersonalGameLibraryManager.src;

import java.io.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Scanner;
import java.util.stream.Collectors;

public class GameList {
    record PrimaryKey(String title, String platform) implements Serializable {}

    private HashMap<PrimaryKey, Game> gameList = new HashMap<>();
    private LinkedHashMap<String, Integer> attributeMaxWidths = new LinkedHashMap<>();

    public GameList() {
        gameList.clear();
        attributeMaxWidths.clear();
        for (String attribute : Game.ATTRIBUTES) {
            attributeMaxWidths.put(attribute, attribute.length());
        }
    }

    private void updateMaxWidth(String attr_name, String attr_val) {
        if (attributeMaxWidths.containsKey(attr_name))
            attributeMaxWidths.put(attr_name, Math.max(attr_val.length(), attributeMaxWidths.get(attr_name)));
        else
            throw new NullPointerException("属性名错误，当前属性名：" + attr_name);
    }

    private int countDeletedGames() {
        int numDeleted = 0;
        for (HashMap.Entry<PrimaryKey, Game> item : gameList.entrySet()) {
            if (item.getValue().getHiddenStatus())
                ++numDeleted;
        }
        return numDeleted;
    }

    private boolean loadGamesFromBinary(String path) {
        System.out.printf("尝试加载二进制文件 '%s' ...\n", path);
        try (FileInputStream fis = new FileInputStream(path)) {
            // decryption
            byte[] encryptedData = fis.readAllBytes();
            String key = XORCipher.getKeyFromUser();
            byte[] decryptedData = XORCipher.decrypt(encryptedData, key);

            // deserialization
            ByteArrayInputStream bais = new ByteArrayInputStream(decryptedData);
            ObjectInputStream ois = new ObjectInputStream(bais);
            gameList = (HashMap<PrimaryKey, Game>) ois.readObject();
            ois.close();

            // update max widths
            for (HashMap.Entry<PrimaryKey, Game> item : gameList.entrySet()) {
                for (int i = 0; i < Game.ATTRIBUTE_NUM; ++i) {
                    updateMaxWidth(Game.ATTRIBUTES.get(i), item.getValue().getAttributes()[i]);
                }
            }
            System.out.println("成功加载 " + gameList.size() + " 款游戏");
            System.out.println("其中有 " + countDeletedGames() + " 款游戏被删除");
            return true;
        } catch (FileNotFoundException e) {
            System.out.println("二进制文件不存在！");
            return false;
        } catch (StreamCorruptedException e) {
            System.out.println("解密失败！请检查密钥是否正确，或文件可能已损坏。");
            return false;
        } catch (IOException | ClassNotFoundException e) {
            System.out.println("从二进制文件中读取数据时发生 I/O 异常：" + e.getMessage());
            return false;
        }
    }

    private boolean loadGamesFromCSV(String path) {
        String line;
        String comma = ",";
        int cnt = 0, total = 0, num_deleted = 0;

        System.out.printf("尝试加载文本文件 '%s' ...\n", path);
        try (BufferedReader br = new BufferedReader(new FileReader(path))) {
            line = br.readLine();   // remove csv header
            while ((line = br.readLine()) != null) {
                ++cnt;
                String[] row = line.split(comma, -1);  // -1 for preserving empty strings
                // System.out.println(row.length);
                if (row.length != Game.ATTRIBUTE_NUM) {
                    System.out.printf("非法行数据（序号：%d）\n", cnt);
                    continue;
                }
                Game newGame = new Game(row);
                PrimaryKey key = new PrimaryKey(row[0], row[1]);
                gameList.put(key, newGame);
                for (int i = 0; i < Game.ATTRIBUTE_NUM; ++i) {
                    updateMaxWidth(Game.ATTRIBUTES.get(i), row[i]);
                }
                ++total;
            }
            System.out.println("成功加载 " + total + " 款游戏");
            System.out.println("其中有 " + countDeletedGames() + " 款游戏被删除");
            return true;
        } catch (FileNotFoundException e) {
            System.out.println("CSV 文件不存在！");
            return false;
        } catch (IOException e) {
            System.out.println("从 CSV 读取数据时发生 I/O 异常：" + e.getMessage());
            return false;
        }
    }

    public void LoadGames(String binPath, String csvPath) {
        System.out.println("正在加载游戏库 ...");
        boolean isSuccessful = loadGamesFromBinary(binPath);
        if (!isSuccessful) {
            isSuccessful = loadGamesFromCSV(csvPath);
            if (!isSuccessful) {
                throw new IllegalArgumentException("请新建游戏库后再启动程序（可以只创建空文件，但一定要有文件）");
            }
        }
    }

    public void AddGame() {
        System.out.println("=> 添加游戏");
        System.out.println("注意，除【备注】【封面路径】【游玩倒计时】外，输入不得为空，否则程序会一直要求输入");

        Game newGame = new Game();
        Scanner in = new Scanner(System.in);

        do {
            System.out.print("平台：");
            newGame.setPlatform(in.nextLine());
        } while (newGame.getPlatform().isEmpty());
        do {
            System.out.print("标题：");
            newGame.setTitle(in.nextLine());
        } while (newGame.getTitle().isEmpty());

        // check the existence
        PrimaryKey key = new PrimaryKey(newGame.getTitle(), newGame.getPlatform());
        if (gameList.containsKey(key) && !gameList.get(key).getHiddenStatus()) {
            System.out.println("【警告】该游戏已存在！请勿重复入库。");
            return;
        }

        do {
            System.out.print("类型：");
            newGame.setType(in.next());
        } while (newGame.getType().isEmpty());
        System.out.print("购买价格（¥）：");
        newGame.setPrice(in.nextDouble());
        System.out.print("购买日期（yyyy-mm-dd）：");
        newGame.setDate(LocalDate.parse(in.next()));
        System.out.print("是否已通关（y/n）：");
        newGame.setIsCleared(in.next());
        System.out.print("游玩时长（h）：");
        newGame.setDuration(in.nextDouble());
        System.out.print("个人评分（0-10）：");
        newGame.setRating(in.nextDouble());
        in.nextLine();
        System.out.print("备注（可直接回车）：");
        newGame.setNote(in.nextLine());
        System.out.print("游戏封面路径（可直接回车）：");
        newGame.setCoverPath(in.nextLine());
        System.out.print("游玩倒计时（d，正整数）（可直接回车，默认 Integer.MAX_VALUE 表示未设置）：");
        String tmp = in.nextLine();
        if (!tmp.isEmpty())
            newGame.setCountdown(Integer.parseInt(tmp));
        gameList.put(key, newGame);

        // update max width
        updateMaxWidth("TITLE", newGame.getTitle());
        updateMaxWidth("PLATFORM", newGame.getPlatform());
        updateMaxWidth("TYPE", newGame.getType());
        updateMaxWidth("DURATION", String.valueOf(newGame.getDuration()));
        updateMaxWidth("PRICE", String.valueOf(newGame.getPrice()));
        updateMaxWidth("RATING", String.valueOf(newGame.getRating()));
        updateMaxWidth("NOTE", newGame.getNote());
        updateMaxWidth("COVER_PATH", newGame.getCoverPath());
        updateMaxWidth("COUNTDOWN", String.valueOf(newGame.getCountdown()));

        System.out.printf("【提示】已成功入库：%s | %s\n", newGame.getTitle(), newGame.getPlatform());
        // in.close();
    }

    private String constructFormat() {
        StringBuilder formatStr = new StringBuilder();

        for (Map.Entry<String, Integer> attrMaxWidth : attributeMaxWidths.entrySet()) {
            if (!attrMaxWidth.getKey().equals("TITLE") && !attrMaxWidth.getKey().equals("IS_HIDDEN")) {
                formatStr.append(" | ");
            }

            int width = Math.max(1, attrMaxWidth.getValue());
            switch (attrMaxWidth.getKey()) {
                case "IS_CLEARED" -> formatStr.append("%-8s");
                case "DATE" -> formatStr.append("%-10s");
                // case "DURATION", "PRICE" -> formatStr.append(String.format("%%-%ds", width + 1));
                // case "RATING" -> formatStr.append(String.format("%%-%ds", width + 5));
                case "IS_HIDDEN" -> {}
                default -> formatStr.append(String.format("%%-%ds", width));
            }

        }
        formatStr.append("\n");

        return formatStr.toString();
    }

    private void printGameList(ArrayList<Game> games) {
        if (games.isEmpty()) {
            System.out.println("未能找到符合要求的游戏！");
            return;
        }

        String formatStr = constructFormat();
        // header
        System.out.printf(formatStr, attributeMaxWidths.keySet().toArray());
        // items
        for (Game game : games) {
            String[] attrs = game.getAttributes();
            attrs[5] = (attrs[5].equals("y")) ? "已通关" : "未通关";
            if (!game.getHiddenStatus())
                System.out.printf(formatStr, (Object[]) attrs);
        }
    }

    public void QueryAllGames() {
        System.out.println("=> 查看全部");
        System.out.printf("共 %d 款游戏\n", gameList.size() - countDeletedGames());
        printGameList(new ArrayList<>(gameList.values()));
    }

    private char getSearchGameOption() {
        System.out.println("选择搜索方式：");
        System.out.println("a）按标题模糊搜索");
        System.out.println("b）按平台筛选");
        System.out.println("c）按类型筛选");
        System.out.println("d）按通关状态筛选");
        System.out.println("e）按价格区间筛选");
        System.out.print(">> ");

        Scanner in = new Scanner(System.in);
        char option = in.nextLine().charAt(0);
        // in.close();

        if (option < 'a' || option > 'e') {
            System.out.println("【警告】非法选项！注意选项范围为 a-e，当前选项" + option);
        }

        return option;
    }

    
    private ArrayList<Game> searchGameByTitle(String t) {
        ArrayList<Game> result = new ArrayList<>();

        // simple blur matching    
        for (HashMap.Entry<PrimaryKey, Game> item : gameList.entrySet()) {
            String title = item.getKey().title().toLowerCase();
            if (title.contains(t.toLowerCase())) {
                result.add(item.getValue());
            }
        }

        return result;
    }

    private ArrayList<Game> searchGameByPlatform(String p) {
        ArrayList<Game> result = new ArrayList<>();

        // simple blur matching    
        for (HashMap.Entry<PrimaryKey, Game> item : gameList.entrySet()) {
            String platform = item.getKey().platform().toLowerCase();
            if (platform.contains(p.toLowerCase())) {
                result.add(item.getValue());
            }
        }

        return result;     
    }

    private ArrayList<Game> searchGameByType(String t) {
        ArrayList<Game> result = new ArrayList<>();

        // simple blur matching    
        for (HashMap.Entry<PrimaryKey, Game> item : gameList.entrySet()) {
            String type = item.getValue().getType().toLowerCase();
            if (type.contains(t.toLowerCase())) {
                result.add(item.getValue());
            }
        }

        return result;        
    }

    private  ArrayList<Game> searchGameByIsCleared(String status) {
        ArrayList<Game> result = new ArrayList<>();

        // simple blur matching    
        for (HashMap.Entry<PrimaryKey, Game> item : gameList.entrySet()) {
            String isCleared = (item.getValue().getIsCleared()) ? "y" : "n";
            if (status.equals(isCleared)) {
                result.add(item.getValue());
            }
        }

        return result;        
    }

    private  ArrayList<Game> searchGameByPrice(String priceStr) {
        ArrayList<Game> result = new ArrayList<>();
        String[] priceList = priceStr.split("\\|");
        double minPrice = Double.parseDouble(priceList[0]);
        double maxPrice = Double.parseDouble(priceList[1]);

        // simple blur matching    
        for (HashMap.Entry<PrimaryKey, Game> item : gameList.entrySet()) {
            double price = item.getValue().getPrice();
            if (price >= minPrice && price <= maxPrice) {
                result.add(item.getValue());
            }
        }

        return result;        
    }

    public void SearchGames() {
        System.out.println("=> 搜索游戏");

        char option = getSearchGameOption();
        ArrayList<Game> result = new ArrayList<>();
        Scanner in = new Scanner(System.in);
        
        switch (option) {
            case 'a':
                System.out.print("请输入游戏标题（支持模糊查询）：");
                String title = in.nextLine();
                result = searchGameByTitle(title);
                break;
            case 'b':
                System.out.print("请输入游戏平台（支持模糊查询）：");
                String platform = in.nextLine();
                result = searchGameByPlatform(platform);
                break;
            case 'c':
                System.out.print("请输入游戏类型（支持模糊查询）：");
                String type = in.nextLine();
                result = searchGameByType(type);
                break;
            case 'd': 
                System.out.print("请输入通关状态（y/n）：");
                String status = in.nextLine();
                result = searchGameByIsCleared(status);
                break;
            case 'e':
                System.out.print("请输入价格范围（单位：¥）（输入格式：最低价|最高价）：");
                String priceStr = in.nextLine();
                result = searchGameByPrice(priceStr);
                break;
            default:
                System.out.println("由于用户输入了非法选项，不采取任何操作！");
        }

        // in.close();
        printGameList(result);
    }

    public void QuickSearchByTitle(String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) {
            System.out.println("【提示】搜索关键词不能为空，可输入如 “search witch”");
            return;
        }
        String trimmedKeyword = keyword.trim();
        System.out.printf("=> 快捷搜索（标题包含：%s）\n", trimmedKeyword);
        ArrayList<Game> result = searchGameByTitle(trimmedKeyword);
        printGameList(result);
    }

    public void UpdateGame() {
        System.out.println("=> 更新游戏");

        Scanner in = new Scanner(System.in);

        System.out.print("请输入要更新的游戏（格式：标题|平台）：");
        String tp = in.nextLine();
        String[] tp_list = tp.split("\\|");
        String title = tp_list[0];
        String platform = tp_list[1];
        String tmp;
        PrimaryKey key = new PrimaryKey(title, platform);

        // check the existence
        if (!gameList.containsKey(key) || gameList.get(key).getHiddenStatus()) {
            // in.close();
            System.out.println("查询的游戏不存在：" + title + " | " + platform);
            return;
        }

        // get and update other attrs
        Game updatedGame = gameList.get(key);
        System.out.println("找到指定游戏！\n注意：直接敲回车表示不更新");
        System.out.printf("当前游玩时长 %.1f h，输入新增小时：", updatedGame.getDuration());

        tmp = in.nextLine();
        if (!tmp.isEmpty()) {
            updatedGame.addDuration(Double.parseDouble(tmp));
            System.out.printf("更新后游玩时长: %.1f\n", updatedGame.getDuration());
        }

        if (updatedGame.getIsCleared()) {
            System.out.println("你已通关该游戏！");
        } else {
            System.out.print("是否标记为已通关（y/n）：");
            String option = in.nextLine();
            if (!option.isEmpty())
                updatedGame.setIsCleared(option);
        }

        System.out.print("更新个人评分：");
        tmp = in.nextLine();
        if (!tmp.isEmpty())
            updatedGame.setRating(Double.parseDouble(tmp));

        System.out.print("更新备注：");
        String note = in.nextLine();
        if (!note.isEmpty())
            updatedGame.setNote(note);

        System.out.print("更新游戏封面路径：");
        String coverPath = in.nextLine();
        if (!coverPath.isEmpty())
            updatedGame.setNote(coverPath);

        System.out.print("更新游玩倒计时：");
        tmp = in.nextLine();
        if (!tmp.isEmpty())
            updatedGame.setCountdown(Integer.parseInt(tmp));

        // in.close();

        // update max widths
        updateMaxWidth("DURATION", String.valueOf(updatedGame.getDuration()));
        updateMaxWidth("RATING", String.valueOf(updatedGame.getRating()));
        updateMaxWidth("NOTE", updatedGame.getNote());
        updateMaxWidth("COVER_PATH", updatedGame.getCoverPath());
        updateMaxWidth("COUNTDOWN", String.valueOf(updatedGame.getCountdown()));

        System.out.printf("【提示】已更新：%s | %s\n", title, platform);
    }

    public void DeleteGame() {
        System.out.println("=> 删除游戏");

        Scanner in = new Scanner(System.in);
        System.out.print("请输入要删除的游戏（格式：标题|平台）：");
        String tp = in.nextLine();
        String[] tp_list = tp.split("\\|");
        String title = tp_list[0];
        String platform = tp_list[1];
        PrimaryKey key = new PrimaryKey(title, platform);

        // check the existence
        if (!gameList.containsKey(key) || gameList.get(key).getHiddenStatus()) {
            // in.close();
            System.out.println("查询的游戏不存在：" + title + " | " + platform);
            return;
        }

        // confirm again
        String option;
        do {
            System.out.print("再次确认是否删除该游戏（" + title + " | " + platform + "）（y/n）：");
            option = in.nextLine();
            if (option.equals("y")) {
                // soft deletion
                Game deletedGame = gameList.get(key);
                deletedGame.setHiddenStatus(true);
                System.out.printf("【提示】已删除：%s | %s\n", title, platform);
            } else if (option.equals("n")) {
                System.out.println("已取消删除操作");
            } else {
                System.out.println("未知选项，请重新输入（y/n）");
            }
        } while (!option.equals("y") && !option.equals("n"));

        // in.close();
    }

    private double getTotalCost() {
        double total = 0.0;
        for (HashMap.Entry<PrimaryKey, Game> item : gameList.entrySet()) {
            if (!item.getValue().getHiddenStatus())
                total += item.getValue().getPrice();
        }
        return total;
    }

    private double getAverageRating() {
        double total = 0.0;
        for (HashMap.Entry<PrimaryKey, Game> item : gameList.entrySet()) {
            if (!item.getValue().getHiddenStatus())
                total += item.getValue().getRating();
        }
        return total / (gameList.size() - countDeletedGames());
    }

    private void printNumberOfGamesByPlatform() {
        Map<String, Integer> platformMap = new HashMap<>();
        for (HashMap.Entry<PrimaryKey, Game> item : gameList.entrySet()) {
            if (item.getValue().getHiddenStatus())
                continue;
            String platform = item.getValue().getPlatform();
            if (platformMap.containsKey(platform)) {
                platformMap.put(platform, platformMap.get(platform) + 1);
            } else {
                platformMap.put(platform, 1);
            }
        }
        for (Map.Entry<String, Integer> item : platformMap.entrySet()) {
            System.out.println("  " + item.getKey() + ": " + item.getValue());
        }
    }

    private int getNumOfClearedGames() {
        int numOfClearedGames = 0;
        for (HashMap.Entry<PrimaryKey, Game> item : gameList.entrySet()) {
            if (item.getValue().getIsCleared() && !item.getValue().getHiddenStatus()) {
                numOfClearedGames += 1;
            }
        }
        return numOfClearedGames;
    }

    public void PrintStats() {
        int numDeleted = countDeletedGames();
        System.out.println("=> 统计报表");
        System.out.println("-------------  个人游戏资产 -------------");
        // total number of games
        System.out.println("总游戏数：" + (gameList.size() - numDeleted));
        // total costs
        System.out.println("总花费：¥" + getTotalCost());
        // average ratings
        System.out.println("平均评分：" + getAverageRating());
        // number of games on each platform (use Map<String, Integer>)
        System.out.println("各平台游戏数：");
        printNumberOfGamesByPlatform();
        // has been cleared
        int numOfClearedGames = getNumOfClearedGames();
        System.out.println("已通关：" + numOfClearedGames + " 款");
        // has not been cleared yet
        System.out.println("未通关：" + (gameList.size() - numDeleted - numOfClearedGames)  + " 款");
        System.out.println("-----------------------------------------");
    }

    private void saveGamesToBinary(String path) throws IOException {
        // serialization
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ObjectOutputStream oos = new ObjectOutputStream(baos);
        oos.writeObject(gameList);
        oos.close();

        // encryption
        String key = XORCipher.getKeyFromUser();
        byte[] serializedData = baos.toByteArray();
        byte[] encryptedData = XORCipher.encrypt(serializedData, key);

        try (FileOutputStream fos = new FileOutputStream(path)) {
            fos.write(encryptedData);
        }
    }

    private void saveGamesToCSV(String path) throws IOException {
        PrintWriter pw = new PrintWriter(path);
        pw.println(Game.ATTRIBUTES.stream().collect(Collectors.joining(",")));
        for (HashMap.Entry<PrimaryKey, Game> item : gameList.entrySet()) {
            pw.println(item.getValue().getCSVString());
        }
        pw.close();
    }

    public void SaveAndExit() {
        System.out.println("=> 保存并退出");
        System.out.println("请选择保存格式：");
        System.out.println(" 1）二进制（快速加载，私有格式，加密）");
        System.out.println(" 2）CSV（可被 Excel 打开）");
        System.out.print("> ");

        Scanner in = new Scanner(System.in);
        int option = in.nextInt();
        // in.close();

        if (option == 1) {
            // save to binary file
            try {
                System.out.printf("正在写出 -> %s ...\n", Main.BIN_PATH);
                saveGamesToBinary(Main.BIN_PATH);
                System.out.println("完成！");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else if (option == 2) {
            // save to csv file
            try {
                System.out.printf("正在写出 -> %s ...  ", Main.CSV_PATH);
                saveGamesToCSV(Main.CSV_PATH);
                System.out.println("完成！");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        System.out.println("感谢使用，再见 \uD83D\uDC4B");
    }
}
