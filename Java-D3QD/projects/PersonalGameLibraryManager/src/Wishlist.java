package PersonalGameLibraryManager.src;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Scanner;

public class Wishlist {
    private static final String CSV_HEADER = "TITLE,PLATFORM,RELEASE_DATE,EXPECTED_PRICE,PRIORITY,NOTE";
    private static final String[] DISPLAY_HEADERS = {
        "PRIORITY",
        "TITLE",
        "PLATFORM",
        "RELEASE_DATE",
        "EXPECTED_PRICE",
        "NOTE"
    };

    private record WishItem(String title,
                            String platform,
                            LocalDate releaseDate,
                            double expectedPrice,
                            int priority,
                            String note) implements Serializable {
        private String toCSV() {
            return String.join(",",
                sanitize(title),
                sanitize(platform),
                releaseDate == null ? "" : releaseDate.toString(),
                String.valueOf(expectedPrice),
                String.valueOf(priority),
                sanitize(note)
            );
        }

        private String sanitize(String origin) {
            return origin == null ? "" : origin.replace(",", " ");
        }
    }

    private final List<WishItem> items = new ArrayList<>();
    private final String storagePath;

    public Wishlist(String storagePath) {
        this.storagePath = storagePath;
        loadWishlist();
    }

    private void loadWishlist() {
        File file = new File(storagePath);
        if (!file.exists()) {
            System.out.println("未找到 wishlist 文件，将在保存时自动创建：" + storagePath);
            return;
        }

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            // skip header if present
            String line = br.readLine();
            if (line == null) {
                return;
            }
            if (!line.startsWith("TITLE")) {
                parseLine(line);
            }
            while ((line = br.readLine()) != null) {
                parseLine(line);
            }
        } catch (IOException e) {
            System.out.println("读取 wishlist 文件失败：" + e.getMessage());
        }
    }

    private void parseLine(String line) {
        if (line == null || line.isBlank()) {
            return;
        }
        String[] row = line.split(",", -1);
        if (row.length < 6) {
            System.out.println("跳过格式错误的 wishlist 行：" + line);
            return;
        }
        try {
            LocalDate releaseDate = row[2].isBlank() ? null : LocalDate.parse(row[2]);
            double expectedPrice = row[3].isBlank() ? 0.0 : Double.parseDouble(row[3]);
            int priority = row[4].isBlank() ? 3 : Integer.parseInt(row[4]);
            items.add(new WishItem(row[0], row[1], releaseDate, expectedPrice, priority, row[5]));
        } catch (NumberFormatException | DateTimeParseException e) {
            System.out.println("跳过格式错误的 wishlist 行：" + line);
        }
    }

    private int indexOf(String title, String platform) {
        for (int i = 0; i < items.size(); ++i) {
            WishItem item = items.get(i);
            if (item.title().equalsIgnoreCase(title) && item.platform().equalsIgnoreCase(platform)) {
                return i;
            }
        }
        return -1;
    }

    private void sortByPriority() {
        items.sort(Comparator.comparingInt(WishItem::priority).thenComparing(WishItem::title));
    }

    public void manageWishlist() {
        System.out.println("=> 心愿单管理");
        Scanner in = new Scanner(System.in);
        boolean inMenu = true;
        while (inMenu) {
            System.out.println("心愿单菜单");
            System.out.println("1）查看心愿单");
            System.out.println("2）添加心愿");
            System.out.println("3）移除心愿");
            System.out.println("4）返回主菜单");
            System.out.print("> ");
            String option = in.nextLine();
            switch (option) {
                case "1" -> viewWishlist();
                case "2" -> addWish(in);
                case "3" -> removeWish(in);
                case "4" -> inMenu = false;
                default -> System.out.println("非法选项，请输入 1-4！");
            }
        }
    }

    private void viewWishlist() {
        if (items.isEmpty()) {
            System.out.println("心愿单为空！");
            return;
        }
        sortByPriority();
        List<String[]> rows = new ArrayList<>();
        int[] widths = new int[DISPLAY_HEADERS.length];
        for (int i = 0; i < DISPLAY_HEADERS.length; ++i) {
            widths[i] = DISPLAY_HEADERS[i].length();
        }

        for (WishItem item : items) {
            String[] row = toDisplayRow(item);
            rows.add(row);
            for (int i = 0; i < row.length; ++i) {
                widths[i] = Math.max(widths[i], row[i].length());
            }
        }

        String format = buildDisplayFormat(widths);
        System.out.printf(format, (Object[]) DISPLAY_HEADERS);
        for (String[] row : rows) {
            System.out.printf(format, (Object[]) row);
        }
    }

    private String[] toDisplayRow(WishItem item) {
        return new String[] {
            String.valueOf(item.priority()),
            item.title(),
            item.platform(),
            item.releaseDate() == null ? "-" : item.releaseDate().toString(),
            String.format("¥%.2f", item.expectedPrice()),
            item.note()
        };
    }

    private String buildDisplayFormat(int[] widths) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < widths.length; ++i) {
            if (i > 0) {
                sb.append(" | ");
            }
            sb.append("%-").append(Math.max(1, widths[i])).append("s");
        }
        sb.append("\n");
        return sb.toString();
    }

    private void addWish(Scanner in) {
        System.out.println("=> 添加心愿");
        String title;
        do {
            System.out.print("标题：");
            title = in.nextLine().trim();
        } while (title.isEmpty());

        System.out.print("平台（可直接回车）：");
        String platform = in.nextLine().trim();
        if (platform.isEmpty()) {
            platform = "未知";
        }

        if (indexOf(title, platform) >= 0) {
            System.out.println("该游戏已存在于心愿单！");
            return;
        }

        System.out.print("发行日期（yyyy-mm-dd，可直接回车）：");
        String dateStr = in.nextLine().trim();
        LocalDate releaseDate = null;
        if (!dateStr.isEmpty()) {
            try {
                releaseDate = LocalDate.parse(dateStr);
            } catch (DateTimeParseException e) {
                System.out.println("日期格式无效，已忽略发行日期。");
            }
        }

        System.out.print("目标价格（¥，可直接回车）：");
        String priceStr = in.nextLine().trim();
        double price = 0.0;
        if (!priceStr.isEmpty()) {
            try {
                price = Double.parseDouble(priceStr);
            } catch (NumberFormatException e) {
                System.out.println("价格格式无效，默认 0。\n");
            }
        }

        System.out.print("优先级（1-5，1 最高，可直接回车，默认 3）：");
        String priorityStr = in.nextLine().trim();
        int priority = 3;
        if (!priorityStr.isEmpty()) {
            try {
                priority = Integer.parseInt(priorityStr);
                if (priority < 1 || priority > 5) {
                    priority = 3;
                }
            } catch (NumberFormatException e) {
                System.out.println("优先级格式错误，默认 3。");
                priority = 3;
            }
        }

        System.out.print("备注（可直接回车）：");
        String note = in.nextLine();

        items.add(new WishItem(title, platform, releaseDate, price, priority, note));
        sortByPriority();
        saveWishlist();
        System.out.println("【提示】已添加到心愿单：" + title + " | " + platform);
    }

    private void removeWish(Scanner in) {
        System.out.println("=> 移除心愿");
        System.out.print("请输入要删除的心愿（格式：标题|平台）：");
        String input = in.nextLine();
        String[] parts = input.split("\\|", -1);
        if (parts.length != 2) {
            System.out.println("格式错误，请使用 标题|平台。");
            return;
        }
        String title = parts[0].trim();
        String platform = parts[1].trim();
        int index = indexOf(title, platform);
        if (index < 0) {
            System.out.println("未找到指定心愿。");
            return;
        }

        // confirm again
        String option;
        do {
            System.out.print("再次确认是否删除该心愿（" + title + " | " + platform + "）（y/n）：");
            option = in.nextLine();
            if (option.equals("y")) {
                WishItem removed = items.remove(index);
                saveWishlist();
                System.out.println("【提示】已移除：" + removed.title() + " | " + removed.platform());
            } else if (option.equals("n")) {
                System.out.println("已取消删除操作");
            } else {
                System.out.println("未知选项，请重新输入（y/n）");
            }
        } while (!option.equals("y") && !option.equals("n"));

    }

    public void saveWishlist() {
        File file = new File(storagePath);
        File parent = file.getParentFile();
        if (parent != null && !parent.exists()) {
            parent.mkdirs();
        }
        try (PrintWriter pw = new PrintWriter(file)) {
            pw.println(CSV_HEADER);
            for (WishItem item : items) {
                pw.println(item.toCSV());
            }
        } catch (IOException e) {
            System.out.println("写出 wishlist 失败：" + e.getMessage());
        }
    }
}
