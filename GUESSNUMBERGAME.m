classdef GUESSNUMBERGAME < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                      matlab.ui.Figure
        ROUNDEditField                matlab.ui.control.NumericEditField
        ROUNDEditFieldLabel           matlab.ui.control.Label
        GENERATOREditField            matlab.ui.control.NumericEditField
        GENERATOREditFieldLabel       matlab.ui.control.Label
        NUMBEROFROUNDSEditField       matlab.ui.control.NumericEditField
        NUMBEROFROUNDSEditFieldLabel  matlab.ui.control.Label
        BESTSCOREEditField            matlab.ui.control.NumericEditField
        BESTSCOREEditFieldLabel       matlab.ui.control.Label
        COMPUTERSCOREEditField        matlab.ui.control.NumericEditField
        COMPUTERSCOREEditFieldLabel   matlab.ui.control.Label
        USERSCOREEditField            matlab.ui.control.NumericEditField
        USERSCOREEditFieldLabel       matlab.ui.control.Label
        QUITButton                    matlab.ui.control.Button
        PLAYAGAINButton               matlab.ui.control.Button
        CHECKButton                   matlab.ui.control.Button
        RESULTEditField               matlab.ui.control.EditField
        RESULTEditFieldLabel          matlab.ui.control.Label
        PLAYERNAMEEditField           matlab.ui.control.EditField
        PLAYERNAMEEditFieldLabel      matlab.ui.control.Label
        NumberGuessingGameLabel       matlab.ui.control.Label
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: CHECKButton
        function CHECKButtonPushed(app, event)
            n=app.EditField.Value;
            while app.ROUNDEditField.Value<app.NUMBEROFROUNDSEditField.Value
                nr=randi([1,100],1,1);
                app.GENERATOREditField.Value=nr;
                app.ROUNDEditField.Value=app.ROUNDEditField.Value+1;
                if n>nr 
                    app.USERSCOREEditField_2.Value=app.USERSCOREEditField_2.Value+1;
                    break;
                elseif n<nr 
                    app.COMPUTERSCOREEditField.Value=app.COMPUTERSCOREEditField.Value+1;
                    break;
                else
                    app.USERSCOREEditField_2.Value=app.USERSCOREEditField_2.Value+1;
                    app.COMPUTERSCOREEditField.Value=app.COMPUTERSCOREEditField.Value+1;
                    break;
                end
            end
            if (app.ROUNDEditField.Value +1)>app.NUMBEROFROUNDSEditField.Value
                if app.USERSCOREEditField_2.Value>app.COMPUTERSCOREEditField.Value
                    app.RESULTEditField.Value=sprintf('CONGRATULATIONS! %s FOR WINNING',app.PLAYERNAMEEditField.Value);
                elseif app.USERSCOREEditField_2.Value<app.COMPUTERSCOREEditField.Value
                    app.RESULTEditField.Value=sprintf('CONGRATULATIONS! COMPUTER FOR WINNING');
                else
                    app.RESULTEditField.Value=sprintf("IT'S A TIE!");
                end
            end
            if (app.ROUNDEditField.Value +1)>app.NUMBEROFROUNDSEditField.Value
                if  app.BESTSCOREEditField.Value<app.USERSCOREEditField_2.Value
                    app.BESTSCOREEditField.Value=app.USERSCOREEditField_2.Value;
                end
            end

        end

        % Button pushed function: PLAYAGAINButton
        function PLAYAGAINButtonPushed(app, event)
            app.NUMBEROFROUNDSEditField.Value=0;
            app.USERSCOREEditField_2.Value=0;
            app.COMPUTERSCOREEditField.Value=0;
            app.ROUNDEditField.Value=0;
            app.RESULTEditField.Value='';
            app.GENERATOREditField.Value=0;
            app.EditField.Value=0;
        end

        % Button pushed function: QUITButton
        function QUITButtonPushed(app, event)
            app.NUMBEROFROUNDSEditField.Value=app.ROUNDEditField.Value;
            n=app.EditField.Value;
            while app.ROUNDEditField.Value<app.NUMBEROFROUNDSEditField.Value
                nr=randi([1,100],1,1);
                app.GENERATOREditField.Value=nr;
                app.ROUNDEditField.Value=app.ROUNDEditField.Value+1;
                if n>nr 
                    app.USERSCOREEditField_2.Value=app.USERSCOREEditField_2.Value+1;
                    break;
                elseif n<nr 
                    app.COMPUTERSCOREEditField.Value=app.COMPUTERSCOREEditField.Value+1;
                    break;
                else
                    app.USERSCOREEditField_2.Value=app.USERSCOREEditField_2.Value+1;
                    app.COMPUTERSCOREEditField.Value=app.COMPUTERSCOREEditField.Value+1;
                    break;
                end
            end
            if (app.ROUNDEditField.Value +1)>app.NUMBEROFROUNDSEditField.Value
                if app.USERSCOREEditField_2.Value>app.COMPUTERSCOREEditField.Value
                    app.RESULTEditField.Value=sprintf('CONGRATULATIONS! %s FOR WINNING',app.PLAYERNAMEEditField.Value);
                elseif app.USERSCOREEditField_2.Value<app.COMPUTERSCOREEditField.Value
                    app.RESULTEditField.Value=sprintf('CONGRATULATIONS! COMPUTER FOR WINNING');
                else
                    app.RESULTEditField.Value=sprintf("IT'S A TIE!");
                end
            end
            if (app.ROUNDEditField.Value +1)>app.NUMBEROFROUNDSEditField.Value
                if  app.BESTSCOREEditField.Value<app.USERSCOREEditField_2.Value
                    app.BESTSCOREEditField.Value=app.USERSCOREEditField_2.Value;
                end
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create NumberGuessingGameLabel
            app.NumberGuessingGameLabel = uilabel(app.UIFigure);
            app.NumberGuessingGameLabel.Position = [254 410 133 49];
            app.NumberGuessingGameLabel.Text = 'Number Guessing Game';

            % Create PLAYERNAMEEditFieldLabel
            app.PLAYERNAMEEditFieldLabel = uilabel(app.UIFigure);
            app.PLAYERNAMEEditFieldLabel.HorizontalAlignment = 'right';
            app.PLAYERNAMEEditFieldLabel.Position = [26 367 86 22];
            app.PLAYERNAMEEditFieldLabel.Text = 'PLAYERNAME';

            % Create PLAYERNAMEEditField
            app.PLAYERNAMEEditField = uieditfield(app.UIFigure, 'text');
            app.PLAYERNAMEEditField.Position = [127 358 221 39];

            % Create RESULTEditFieldLabel
            app.RESULTEditFieldLabel = uilabel(app.UIFigure);
            app.RESULTEditFieldLabel.HorizontalAlignment = 'right';
            app.RESULTEditFieldLabel.Position = [81 73 51 22];
            app.RESULTEditFieldLabel.Text = 'RESULT';

            % Create RESULTEditField
            app.RESULTEditField = uieditfield(app.UIFigure, 'text');
            app.RESULTEditField.Position = [147 60 360 48];

            % Create CHECKButton
            app.CHECKButton = uibutton(app.UIFigure, 'push');
            app.CHECKButton.ButtonPushedFcn = createCallbackFcn(app, @CHECKButtonPushed, true);
            app.CHECKButton.Position = [441 357 157 40];
            app.CHECKButton.Text = 'CHECK';

            % Create PLAYAGAINButton
            app.PLAYAGAINButton = uibutton(app.UIFigure, 'push');
            app.PLAYAGAINButton.ButtonPushedFcn = createCallbackFcn(app, @PLAYAGAINButtonPushed, true);
            app.PLAYAGAINButton.Position = [69 13 139 35];
            app.PLAYAGAINButton.Text = 'PLAYAGAIN';

            % Create QUITButton
            app.QUITButton = uibutton(app.UIFigure, 'push');
            app.QUITButton.ButtonPushedFcn = createCallbackFcn(app, @QUITButtonPushed, true);
            app.QUITButton.Position = [387 13 162 34];
            app.QUITButton.Text = 'QUIT';

            % Create USERSCOREEditFieldLabel
            app.USERSCOREEditFieldLabel = uilabel(app.UIFigure);
            app.USERSCOREEditFieldLabel.HorizontalAlignment = 'right';
            app.USERSCOREEditFieldLabel.Position = [117 135 81 22];
            app.USERSCOREEditFieldLabel.Text = 'USERSCORE';

            % Create USERSCOREEditField
            app.USERSCOREEditField = uieditfield(app.UIFigure, 'numeric');
            app.USERSCOREEditField.Position = [213 125 118 42];

            % Create COMPUTERSCOREEditFieldLabel
            app.COMPUTERSCOREEditFieldLabel = uilabel(app.UIFigure);
            app.COMPUTERSCOREEditFieldLabel.HorizontalAlignment = 'right';
            app.COMPUTERSCOREEditFieldLabel.Position = [347 133 116 22];
            app.COMPUTERSCOREEditFieldLabel.Text = 'COMPUTERSCORE';

            % Create COMPUTERSCOREEditField
            app.COMPUTERSCOREEditField = uieditfield(app.UIFigure, 'numeric');
            app.COMPUTERSCOREEditField.Position = [478 121 146 46];

            % Create BESTSCOREEditFieldLabel
            app.BESTSCOREEditFieldLabel = uilabel(app.UIFigure);
            app.BESTSCOREEditFieldLabel.HorizontalAlignment = 'right';
            app.BESTSCOREEditFieldLabel.Position = [23 311 79 22];
            app.BESTSCOREEditFieldLabel.Text = 'BESTSCORE';

            % Create BESTSCOREEditField
            app.BESTSCOREEditField = uieditfield(app.UIFigure, 'numeric');
            app.BESTSCOREEditField.Position = [117 299 153 46];

            % Create NUMBEROFROUNDSEditFieldLabel
            app.NUMBEROFROUNDSEditFieldLabel = uilabel(app.UIFigure);
            app.NUMBEROFROUNDSEditFieldLabel.HorizontalAlignment = 'right';
            app.NUMBEROFROUNDSEditFieldLabel.Position = [299 309 126 22];
            app.NUMBEROFROUNDSEditFieldLabel.Text = 'NUMBEROFROUNDS';

            % Create NUMBEROFROUNDSEditField
            app.NUMBEROFROUNDSEditField = uieditfield(app.UIFigure, 'numeric');
            app.NUMBEROFROUNDSEditField.Position = [440 295 158 50];

            % Create GENERATOREditFieldLabel
            app.GENERATOREditFieldLabel = uilabel(app.UIFigure);
            app.GENERATOREditFieldLabel.HorizontalAlignment = 'right';
            app.GENERATOREditFieldLabel.Position = [405 213 80 22];
            app.GENERATOREditFieldLabel.Text = 'GENERATOR';

            % Create GENERATOREditField
            app.GENERATOREditField = uieditfield(app.UIFigure, 'numeric');
            app.GENERATOREditField.Position = [500 205 114 37];

            % Create ROUNDEditFieldLabel
            app.ROUNDEditFieldLabel = uilabel(app.UIFigure);
            app.ROUNDEditFieldLabel.HorizontalAlignment = 'right';
            app.ROUNDEditFieldLabel.Position = [26 211 49 22];
            app.ROUNDEditFieldLabel.Text = 'ROUND';

            % Create ROUNDEditField
            app.ROUNDEditField = uieditfield(app.UIFigure, 'numeric');
            app.ROUNDEditField.Position = [90 205 82 33];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = GUESSNUMBERGAME

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end