import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.Insets;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;

import javax.swing.JLabel;

import org.scilab.forge.jlatexmath.TeXConstants;
import org.scilab.forge.jlatexmath.TeXFormula;
import org.scilab.forge.jlatexmath.TeXIcon;

public class LatexRenderer {

    public static void main(String[] args) {
        try {
            File logFile = new File("Log.txt");
            logFile.createNewFile();
            System.setOut(new PrintStream(new FileOutputStream(logFile.getAbsolutePath()), true));
        }
        catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace(System.out);
        }
        catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace(System.out);
        }
        
        System.out.println("New run ------------");
        
        if(args.length < 1)
            throw new RuntimeException("Arguments missing! A string must be provided with the LaTeX string to render.");
        
        System.out.println("Instantiating formula");
        TeXFormula formula = new TeXFormula(args[0]);

        System.out.println("Creating icon");
        TeXIcon icon = formula.new TeXIconBuilder().setStyle(TeXConstants.STYLE_DISPLAY).setSize(100).build();
        icon.setInsets(new Insets(5, 5, 5, 5));

        System.out.println("Copying to clipboard");
        ClipboardImageManager clipImg = new ClipboardImageManager(latexIconToImage(icon));
        clipImg.copyToClipboard();
        
        System.out.println("Done");
    }

    private static Image latexIconToImage(TeXIcon icon) {
        BufferedImage image = new BufferedImage(icon.getIconWidth(), icon.getIconHeight(), BufferedImage.TYPE_INT_ARGB);
        Graphics2D g2 = image.createGraphics();

        g2.setColor(Color.white);
        g2.fillRect(0, 0, icon.getIconWidth(), icon.getIconHeight());

        JLabel jl = new JLabel();
        jl.setForeground(new Color(0, 0, 0));
        icon.paintIcon(jl, g2, 0, 0);

        return image;
    }
}
