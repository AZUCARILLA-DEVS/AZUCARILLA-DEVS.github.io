package ;

import haxe.ui.HaxeUIApp;

class Main {

    private static var app:HaxeUIApp;
    private static var view:MainView;

    public static function main() {
        app = new HaxeUIApp();
        app.ready(init);
    }

    private static function init() {
        view = new MainView();
        app.addComponent(view);
        app.start();
    }
}
