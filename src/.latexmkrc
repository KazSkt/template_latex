$pdf_mode = 3;
$latex = 'platex -halt-on-error -file-line-error';
$dvipdf = 'dvipdfmx %O -o %D %S';
$makeindex = 'mendex %O -o %D %S';
$bibtex = 'pbibtex';
$biber = 'biber --bblencoding=utf8 -u -U --output_safechars';
