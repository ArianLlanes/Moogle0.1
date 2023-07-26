#!/bin/bash
clear

run()
{
    echo "Abriendo Moogle..."
    cd ../
    dotnet watch run --project MoogleServer
}

clean()
{
    clear 
    echo "Eliminando basura..."
    cd ../Informe
    rm -f *.log *.aux *.out *.pdf
    cd ../Presentacion
    rm -f *.log *.aux *.out *.pdf *.toc *.smn *.nav
    echo "Basura eliminada"

}

report()
{
    clear
    echo "Creando Reporte..."
    cd ../Informe
    pdflatex -synctex=1 -interaction=nonstopmode informe.tex

    echo "Reporte Creado"
}

slides()
{
    clear
    echo "Creando Presentacion"
    cd ../Presentacion
    pdflatex -synctex=1 -interaction=nonstopmode presentacion.tex
}

show_report(){
    cd ..
    cd Informe
    archivo="informe.pdf"

    if [ ! -e "$archivo" ]; then
        report
        xdg-open informe.pdf
    else
        xdg-open informe.pdf
    fi
}

show_slides(){
    cd ..
    cd Presentacion
    archivo="presentacion.pdf"

    if [ ! -e "$archivo" ]; then
        slides
        xdg-open presentacion.pdf
    else
        xdg-open presentacion.pdf
    fi
}

case "$1" in
run)
run "${@:2}"
;;
clean)
clean "${@:2}"
;;
report)
report "${@:2}"
;;
slide)
slide "${@:2}"
;;
show_report)
show_report "${@:2}"
;;
show_slides)
show_slides "${@:2}"
;;
esac