#!/usr/bin/env perl

$latexargs          = '-shell-escape -synctex=1 -interaction=nonstopmode';
$latexsilentargs    = $latexargs . ' -interaction=batchmode';
$latex              = 'platex ' . $latexargs;
$latex_silent       = 'platex ' . $latexsilentargs;
$dvipdf             = 'dvipdfmx %O -o %D %S';
$bibtex             = 'pbibtex';
$biber              = 'biber --bblencoding=utf8 -u -U --output_safechars';
$makeindex          = 'mendex %O -o %D %S';
$max_repeat         = 5;

## $pdf_mode        = 0; # No PDF
## $pdf_mode        = 1; # pdflatex
## $pdf_mode        = 2; # ps2pdf
$pdf_mode           = 3; # dvipdfmx

$pvc_view_file_via_temporary = 0;

$aux_dir          = 'build';
$out_dir          = $aux_dir;
