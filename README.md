Essentially the whole application is JavaScript based on the foundations called ExtJS; which provides an extremely powerful set of tools, components, and sheer brute force to make the web application more desktop-like. The framework allows for the creation of interfaces (without having to manually tinkle with traditional mark-up languages); composing of controls specifically created for their needed purpose.

Ext.Direct allows for direct invocation of Programmatic objects from JavaScript. The functionality it provides allows for the Programmatic objects located on the server side, to be directly accessed from the JavaScript code. It behaves as dedicated ‘communication’ layer in between the GUI and the BOL, which essentially adds a layer to the application called an ‘API’ which has the list of classes with methods contained on the Server with an Ajax wrapper for sending/receiving.

The catch though, is that the server side must also have something of equivalence to relay the responses once more to the corresponding Business Object. The choice for the server side ExtJS companion ended up being ‘DirectJNgine’ which is derivative from ‘Ext.Direct Java Engine’.

The entire web application is built in such a way which easily supports expandability; using a modular based format (with a window system) it caters the function to spawn modules, create modules on the fly, and to also regulate access to those modules through the assignation of the appropriate group permissions to the user accounts accessing the system.

You will need to install NetBeans in order to open the project files, which can be found at http://dlc.sun.com.edgesuite.net/netbeans/7.4/final/ and download the windows version. This version is combined with the Glassfish application server.

MySQL will also need to be installed, which will require importing the SQL dump file. The connection settings are located in the src/java/dal/Dal.java file.
