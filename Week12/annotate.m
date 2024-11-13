function annotate(modelName)
% ANNOTATE Add block name annotations for all blocks in a Simulink model.
%
%   ANNOTATE(modelName) adds block name annotations for all blocks in 
%   the Simulink model specified by 'modelName'.
%
%   Example:
%       annotate('my_model');
%
%   Inputs:
%       modelName - The name of the Simulink model (string).
%
%   See also: find_system, set_param.

    % Check if the model is already open
    alreadyOpen = false;
    if ~isempty(bdroot(modelName))
        alreadyOpen = true;
        % Check if the model has changes that need saving
        saveFlag = bdIsDirty(modelName);
        if saveFlag
            error(['Model "%s" is already open and has unsaved ' ...
                'changes. Please save your changes, and try ' ...
                'again.'], modelName);
        end
    end

    % Open the model if not already open
    if ~alreadyOpen
        fprintf("Opening %s\n", modelName)
        open_system(modelName);
    end
    
    % Get all blocks in the model
    blocks = find_system(modelName, 'Type', 'Block');
    
    % Loop through each block and add an annotation
    isError = false;
    for i = 1:numel(blocks)
        try
            set_param(blocks{i}, 'AttributesFormatString', '%<Name>');
            fprintf("Successfully updated annotation on block %s\n", blocks{i});
        catch ex
            isError = true;
            fprintf('Error enabling block name annotations for block "%s": %s\n', blocks{i}, ex.message);
        end
    end
    
    % Save and close the model
    fprintf("Saving %s\n", modelName);
    save_system(modelName);
    if ~alreadyOpen
        close_system(modelName);
    end
    fprintf("Finished");
    if isError
        fprintf(". However, an error occurred, please investigate.\n");
    else
        fprintf(" successfully.\n");
    end
end
