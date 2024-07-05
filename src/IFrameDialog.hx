import util.Constants;
import custom.IFrame;
import haxe.ui.containers.dialogs.Dialog;

class IFrameDialog extends Dialog {
    
    var comicTitle:String;
    var view:IFrame;

    public function new(title:String) {
        super();
        this.modal = false;
        this.width = 900;
        this.height = 700;

        comicTitle = title;

        view = new IFrame();
        view.url = '${Constants.COMIC_URL}${comicTitle}.pdf';
        addComponent(view);
    }
}