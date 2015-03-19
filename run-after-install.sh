#!/bin/bash

echo -------------------------------------------------------------------
echo Instalar Emacs e Vim? [ 1/0 ]
echo -------------------------------------------------------------------
read opcao
if [ $opcao -eq 1 ] ; then
    sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg \
	 emacs-goodies-el vim
fi

echo -------------------------------------------------------------------
echo Instalar LaTeX? [ 1/0 ]
echo -------------------------------------------------------------------
read opcao
if [ $opcao -eq 1 ] ; then
    sudo apt-get install -y texlive-base texlive-bibtex-extra \
	 texlive-fonts-extra texlive-fonts-recommended \
	 texlive-generic-extra texlive-latex-extra texlive-math-extra \
	 texlive-plain-extra texlive-science latex-xcolor latex-beamer \
	 texlive-lang-portuguese \
	 cm-super cm-super-minimal cm-super-x11 auctex
fi

echo -------------------------------------------------------------------
echo Instalar fontes extras? [ 1/0 ]
echo -------------------------------------------------------------------
read opcao
if [ $opcao -eq 1 ] ; then
    sudo apt-get install -y ttf-bitstream-vera ttf-dejavu fonts-inconsolata \
	 ttf-liberation fonts-linuxlibertine 
fi

echo -------------------------------------------------------------------
echo Instalar fontes nonfree do LaTeX? [ 1/0 ]
echo -------------------------------------------------------------------
read opcao
if [ $opcao -eq 1 ] ; then
    echo
    echo Baixando o instalador de tug.org
    wget http://tug.org/fonts/getnonfreefonts/install-getnonfreefonts
    echo
    echo Instalando o programa
    texlua install-getnonfreefonts
    echo
    echo Baixando e instalando todas as fontes nonfree
    getnonfreefonts-sys -a
    updmap-sys
    texhash
    echo
    echo Removendo instalador...
    rm install-getnonfreefonts
fi

echo -------------------------------------------------------------------
echo Instalar Chromium? [ 1/0 ]
echo -------------------------------------------------------------------
read opcao
if [ $opcao -eq 1 ] ; then
    apt-get install -y chromium-browser chromium-codecs-ffmpeg-extra
fi

echo -------------------------------------------------------------------
echo Instalar utilidades para desktop? [ 1/0 ]
echo -------------------------------------------------------------------
read opcao
if [ $opcao -eq 1 ] ; then
    apt-get install -y shutter python-gpgme # para o dropbox daemon
fi

echo -------------------------------------------------------------------
echo Instalar pacotes de produtividade? [ 1/0 ]
echo -------------------------------------------------------------------
read opcao
if [ $opcao -eq 1 ] ; then
    sudo apt-get install -y dia maxima wxmaxima gnuplot
fi

echo -------------------------------------------------------------------
echo Instalar pacotes multimidia? [ 1/0 ]
echo -------------------------------------------------------------------
read opcao
if [ $opcao -eq 1 ] ; then
    sudo apt-get install -y ubuntu-restricted-extras
fi

echo -------------------------------------------------------------------
echo Instalar Java e plugins? [ 1/0 ]
echo -------------------------------------------------------------------
read opcao
if [ $opcao -eq 1 ] ; then
    apt-get install -y default-jdk icedtea-plugin
fi

echo -------------------------------------------------------------------
echo Instalar lm-sensors? [ 1/0 ]
echo -------------------------------------------------------------------
read opcao
if [ $opcao -eq 1 ] ; then
    apt-get install -y lm-sensors psensor
    echo 
    echo ATENÇÃO!
    echo --------
    echo Lembre-se de rodar
    echo sudo sensors-detect
    echo e YES em todas
    echo NOTA: o psensor vai ser iniciado automaticamente em cada sessão
    echo
fi

exit
