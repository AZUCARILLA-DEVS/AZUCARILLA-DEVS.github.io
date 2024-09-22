package;

import util.Constants;
import haxe.ui.containers.dialogs.Dialog.DialogEvent;
import haxe.ui.containers.Grid;
import haxe.ui.components.Button;
import haxe.ui.components.Link;
import haxe.ui.components.Image;
import haxe.ui.containers.dialogs.MessageBox.MessageBoxType;
import haxe.ui.containers.dialogs.Dialogs;
import haxe.ui.containers.VBox;
import haxe.ui.events.MouseEvent;

@:build(haxe.ui.ComponentBuilder.build("assets/main-view.xml"))
class MainView extends VBox {

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
            i.onClick = function(e:MouseEvent) {
                var dialogview = new IFrameDialog(i.text);
                dialogview.onDialogClosed = function(e:DialogEvent) {
                    trace(e.button);
                    dialogview.disposeComponent();
                }
                dialogview.showDialog(true);
            };
            index++;
        }
    }
    
    @:bind(about, MouseEvent.CLICK)
    private function onMyButton(e:MouseEvent) {
        Dialogs.messageBox(Constants.ABOUT, "Acerca de", MessageBoxType.TYPE_INFO);
    }
}