############# Define functions ##############
# Some one-liners: have(), le() {{{
have() { type "$1" &> /dev/null; }
function le(){ ls -l "$@" | egrep "^d" ; ls -lXB "$@" 2>&-| egrep -v "^d|total "; }
# }}}

# swap() -- switch 2 filenames around {{{
function swap()
{
    if [ $# -ne 3 ];then
        return
    fi
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}
# }}}

# ex() -- Extract compressed files (tarballs, zip, etc) {{{
ex() {
for file in "$@"; do
        if [ -f "$file" ]; then
                local file_type=$(file -bizL "$file")
                case "$file_type" in
                *application/x-tar*|*application/zip*|*application/x-zip*|*application/x-cpio*)
                        bsdtar -x -f "$file" ;;
                *application/x-gzip*)
                        gunzip -d -f "$file" ;;
                *application/x-bzip*)
                        bunzip2 -f "$file" ;;
                *application/x-rar*)
                        7z x "$file" ;;
                *application/octet-stream*)
                        local file_type=$(file -bzL "$file")
                        case "$file_type" in
                                7-zip*) 7z x "$file" ;;
                                *) echo -e "Unknown filetype for '$file'\n$file_type" ;;
                        esac ;;
                *)
                        echo -e "Unknown filetype for '$file'\n$file_type" ;;
                esac
        else
                echo "'$file' is not a valid file"
        fi
done
}
# }}}

# mkrawdisk{{{
mkrawdisk(){
    if [ $# -ne 2 ];then
        echo "Usage:$0 <filename>.vmdk </dev/xxx>"
        return
    fi
    outputfile=$1
    diskname=$2
    VBoxManage internalcommands createrawvmdk -filename ${outputfile}.vmdk -rawdisk $diskname
}
# }}}

