package;

import haxe.ui.ToolkitAssets;
import haxe.ui.containers.Grid;
import haxe.ui.components.Button;
import haxe.ui.components.Link;
import haxe.ui.components.Image;
import haxe.ui.containers.dialogs.MessageBox.MessageBoxType;
import haxe.ui.containers.dialogs.Dialogs;
import haxe.ui.containers.VBox;
import haxe.ui.constants.ScaleMode;
import haxe.ui.events.MouseEvent;

@:build(haxe.ui.ComponentBuilder.build("assets/main-view.xml"))
class MainView extends VBox {
    
    var aboutmsg = "Comic Picker v1.0\n\nProgramador: Jaime Humberto Macias Bustamante
    \n\n© 2024 Azucarilla-Devs";

    public function new() {
        super();
        setImages();
    }

    function setImages() {
        var index = 89;
        for(i in [comic1, comic2, comic3, comic4, comic5, comic6, comic7, comic8, comic9])
        {
            var image = new Image();
            image.resource = 'assets/thumb/${index}.jpg';
            switch(index)
            {
                case 89 | 90:
                    image.imageScale = 0.1;
                case 91:
                    image.imageScale = 0.19;
                case 92 | 93 | 94:
                    image.imageScale = 0.48;
                case 95:
                    image.imageScale = 1.5;
                case 96 | 97:
                    image.imageScale = 0.15;
            }
            i.icon = image;
            i.text = 'FIM ${index}';
            i.onClick = (MouseEvent) -> {
                new IFrameDialog(i.text).show();
            };
            index++;
        }
    }
    
    @:bind(about, MouseEvent.CLICK)
    private function onMyButton(e:MouseEvent) {
        Dialogs.messageBox(aboutmsg, "Acerca de", MessageBoxType.TYPE_INFO);
    }
}