/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Commands;

/**
 *
 * @author d00186050
 */
public class CommandFactory {

    private volatile static CommandFactory currentInstance;

    private CommandFactory() {

    }

    public static CommandFactory getInstance() {

        if (currentInstance == null) {
            synchronized (CommandFactory.class) {
                if (currentInstance == null) {
                    currentInstance = new CommandFactory();
                }
            }
        }
        return currentInstance;
    }

    public static Command createCommand(String action) {
        Command command = null;
        if (action != null) {
            switch (action) {
                case "login":
                    command = new LoginCommand();
                    break;
                case "register":
                    command = new RegisterCommand();
                    break;
                case "addProduct":
                    command = new AddProductCommand();
                    break;
                case "update":
                    command = new UpdateProductsCommand();
                    break;

                default:
                    command = new NoValidActionCommand();
                    break;
            }
        } else {
            command = new NoActionSuppliedCommand();
        }
        return command;
    }
}
