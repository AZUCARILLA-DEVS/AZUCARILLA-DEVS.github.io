import js.html.MessageEvent;
import util.Constants;
import custom.IFrame;
import haxe.ui.containers.dialogs.Dialog;

class IFrameDialog extends Dialog {
    
    var comicTitle:String;
    var view:IFrame;

    public function new(title:String) {
        super();
        this.width = 900;
        this.height = 700;

        comicTitle = title;

        view = new IFrame();
        view.onCreate = () -> {
            view._iframe.contentWindow.addEventListener('message', (e:MessageEvent) -> {
                trace(e.origin);
                if(e.origin == 'https://azucarilla.wixsite.com') {
                    trace("Oh! Hi Twilight!");
                }
                else return;
            });
        }
        view.url = '${Constants.COMIC_URL}${comicTitle}.pdf';
        view.width = 820;
        view.height = 600;
        addComponent(view);
    }
}