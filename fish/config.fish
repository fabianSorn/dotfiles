function vnc_to_vpc
    set config_name "vpc"
    set port 5901
    if test (count $argv) -ge 1
        set config_name $argv[1]
    else if test (count $argv) -ge 2
	      set port $argv[2]
    end
    ssh -f -N $config_name
    open -W vnc://localhost:5901
    killall ssh
end


function texmake
    if test (count $argv) -ge 1
        set document $argv[1]
    else
        echo "No Document name was passed" 
        exit 1
    end
    echo Build document $document
    pdflatex -interaction=nonstopmode $document
    biber $document
    pdflatex -interaction=nonstopmode $document
    pdflatex -interaction=nonstopmode $document
end

