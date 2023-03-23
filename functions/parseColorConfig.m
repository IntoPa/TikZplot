function configList = parseColorConfig(config_name)
    fid = fopen(['./config/colorStyle/', config_name]);

    if fid == -1
        fprintf( 'Unable to open color config file ''%s''\n', config_name);
        return;
    end
    
    while(~feof(fid))
        tline =fgetl(fid);
        if(~isempty(tline))
            if((tline(1) ~= '%'))
                c = strsplit(tline,',');
                numeric = str2num(c{2});
                if isempty(numeric)
                    configStruct.(c{1}) = c{2};
                else
                    configStruct.(c{1}) = numeric;
                end
            end
        end
    end
 
    fclose(fid);
    configList = {};
    for optField = fieldnames(configStruct)'
        configList{end+1} = char(optField);
        configList{end+1} = configStruct.(char(optField));
    end
    %listdlg(configList{:})
end