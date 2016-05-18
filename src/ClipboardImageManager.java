import java.awt.Image;
import java.awt.Toolkit;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.ClipboardOwner;
import java.awt.datatransfer.Transferable;

public class ClipboardImageManager implements ClipboardOwner {
    TransferableImage transImg;
    public ClipboardImageManager(Image img) {
        transImg = new TransferableImage(img);
    }
    
    public void copyToClipboard() {
        Clipboard c = Toolkit.getDefaultToolkit().getSystemClipboard();
        c.setContents(transImg, this);
    }

    @Override
    public void lostOwnership(Clipboard arg0, Transferable arg1) {
        throw new RuntimeException("Lost ownership of clipboard!");
    }
}
