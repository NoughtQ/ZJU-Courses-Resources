package PersonalGameLibraryManager.src;

import java.util.Scanner;

public class Main {
    public static final String BIN_PATH = "data/game_lib.dat";
    public static final String CSV_PATH = "data/game_lib.csv";
    public static final String WISHLIST_PATH = "data/wishlist.csv";

    private enum GameMenuShortcutResult {
        NONE,
        HANDLED,
        EXIT_MENU
    }

    public static void main(String args[]) {
        System.out.println("========== Personal Game Library Manager ==========");

        GameList gameList = new GameList();
        loadGameLibrary(gameList);
        Wishlist wishlist = new Wishlist(WISHLIST_PATH);
        System.out.println("===================================================");

        Scanner in = new Scanner(System.in);
        boolean exit = false;
        while (!exit) {
            printMainMenu();
            System.out.println("---------------------------------------------------");
            System.out.print("> ");
            String opt = in.nextLine().trim();
            switch (opt) {
                case "1" -> handleGameLibraryMenu(gameList, in);
                case "2" -> wishlist.manageWishlist();
                case "3" -> {
                    gameList.SaveAndExit();
                    wishlist.saveWishlist();
                    exit = true;
                }
                default -> System.out.println("请输入 1-3 之间的整数！");
            }
        }
        in.close();
        System.out.println("===================================================");
    }

    private static void printMainMenu() {
        System.out.println("主菜单");
        System.out.println("1）游戏库菜单");
        System.out.println("2）心愿单菜单");
        System.out.println("3）保存并退出");
    }

    private static void handleGameLibraryMenu(GameList gameList, Scanner in) {
        boolean backToMain = false;
        while (!backToMain) {
            printGameLibraryMenu();
            System.out.println("---------------------------------------------------");
            System.out.print("> ");
            String opt = in.nextLine().trim();
            GameMenuShortcutResult shortcutResult = handleGameLibraryShortcut(opt, gameList);
            if (shortcutResult == GameMenuShortcutResult.EXIT_MENU) {
                backToMain = true;
                continue;
            } else if (shortcutResult == GameMenuShortcutResult.HANDLED) {
                continue;
            }
            switch (opt) {
                case "0" -> loadGameLibrary(gameList);
                case "1" -> gameList.AddGame();
                case "2" -> gameList.QueryAllGames();
                case "3" -> gameList.SearchGames();
                case "4" -> gameList.UpdateGame();
                case "5" -> gameList.DeleteGame();
                case "6" -> gameList.PrintStats();
                case "7" -> backToMain = true;
                default -> System.out.println("请输入 0-7 之间的整数！");
            }
        }
    }

    private static void printGameLibraryMenu() {
        System.out.println("游戏库菜单");
        System.out.println("0）重新加载游戏库");
        System.out.println("1）添加游戏（add）");
        System.out.println("2）查看全部");
        System.out.println("3）搜索游戏（search）");
        System.out.println("4）更新游戏");
        System.out.println("5）删除游戏");
        System.out.println("6）统计报表（stats）");
        System.out.println("7）返回主菜单（exit）");
    }

    private static GameMenuShortcutResult handleGameLibraryShortcut(String input, GameList gameList) {
        if (input == null || input.isEmpty()) {
            return GameMenuShortcutResult.NONE;
        }

        String[] tokens = input.split("\\s+", 2);
        String command = tokens[0].toLowerCase();
        switch (command) {
            case "add":
                gameList.AddGame();
                return GameMenuShortcutResult.HANDLED;
            case "search":
                if (tokens.length > 1 && !tokens[1].isEmpty()) {
                    gameList.QuickSearchByTitle(tokens[1]);
                } else {
                    gameList.SearchGames();
                }
                return GameMenuShortcutResult.HANDLED;
            case "stats":
                gameList.PrintStats();
                return GameMenuShortcutResult.HANDLED;
            case "exit":
                return GameMenuShortcutResult.EXIT_MENU;
            default:
                return GameMenuShortcutResult.NONE;
        }
    }

    private static void loadGameLibrary(GameList gameList) {
        try {
            gameList.LoadGames(BIN_PATH, CSV_PATH);
        } catch (RuntimeException e) {
            System.out.println("加载游戏库失败：" + e.getMessage());
            System.out.println("可在修复问题后重新选择“重新加载游戏库”再试。");
        }
    }
}
