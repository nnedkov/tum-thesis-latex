# LaTeX template for TUM theses

This is a LaTeX template created according to the guidelines for TUM Informatics theses in SS 2016. **Always check the [current formatting guidelines][thesis-guidelines] before you hand in.** See [`build/main.pdf`][sample-pdf] for an example PDF created with this template.

Comments and contributions are welcome!

## Super Quickstart

 * Clone this repository
 * Install dependencies: `sudo apt-get install texlive-latex-base biber inotify-tools`
 * Before you start editing, enable automatic compilation by executing `./helputils.sh 2` in a bash shell. Later, when you edit tex files and save your changes, the PDF will be updated automatically. Obviously **in case you have some major LaTex syntax error the automatic compilation will fail**
 * Look for `TODO` comments in the provided tex files to get hints where to start
 * When you have updated your bibliography in the bib file execute `./helputils.sh 5` to update the PDF
 * I strongly recommend using Git while you write your thesis as it's the only sane way to track changes and keep multiple versions of your files. If you decide to do so, maybe you will find useful deleting the built files and trailing whitespaces from your files before doing commits. Do so by executing `./helputils.sh 3 4`. In order to view all options of the helping script type: `./helputils.sh`


If you have any problems with the template feel free to [create an issue][issue]. For general LaTeX questions use [TeX StackExchange][tex-se].

## Credits

This template is a modified (derived) version from [this template][orig-template-url]. The original authors are ([Florian Walch and other contributors][orig-template-authors]).

## Changes made

* The Makefile was substituted with the bash script `helputils.sh`. The script provides some useful additional functionality:
	1. List available options (type `./helputils.sh 1`):
		Prints all available options provided by the script.
	2. Automatic compilation (type `./helputils.sh 2`):
		The script enters a blocking state. When a change is detected in a tex file the script unblocks and triggers compilation. Keep in mind that changes are detected only when they are saved to disk.
	3. Deletion of built files (type `./helputils.sh 3`):
		Compilation generates a big number of log files in the build directory. This command cleans your build directory without deleting the produced PDF.
	4. Deletion of trailing whitespaces from .tex, .sh and .bib files (type `./helputils.sh 4`):
		Trailing whitespaces suck. They drive people crazy. They are parasites that eat up your disk space unnecessarily. If you happen to have digital OCD as I do, this command will help you keep your sanity. Keep your files parasite-free!
	5. Updating bibliography (type `./helputils.sh 5`):
		Updating your bibliography requires more than a single compilation. I don't know why this happens and I never got curious enough to find out. For performance reasons automatic compilation performs a single compilation. Hence, when you change the bib file use this command to update the references on the PDF.
* I included the university and faculty logos in the `logos` directory. Unfortunately, the original template was pointing to invalid urls so in order to save you time finding them I added them directly in this repository. Additionally, the bash script for cropping the logos was omitted as they already have the appropriate shape.
* A new page with Abbreviations and Acronyms was added.

## License

[![Creative Commons License][license-image]][license]

This template is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License][license], meaning that:

 * You can share (copy, redistribute) and adapt (remix, transform, build upon) this template for any purpose, even commercially.
 * If you share the template or a modified (derived) version of it, you must attribute the template to the original authors [Florian Walch and contributors][orig-template-authors] by providing a [link to the original template][orig-template-url] and indicate if changes were made.
 * Any derived template has to use the [same][license] or a [compatible license][license-compatible].

The license **applies only to the template**; there are no restrictions on the resulting PDF file or the contents of your thesis.

[issue]: https://github.com/nnedkov/tum-thesis-latex/issues
[license-compatible]: https://creativecommons.org/compatiblelicenses
[license-image]: https://i.creativecommons.org/l/by-sa/4.0/88x31.png
[license]: https://creativecommons.org/licenses/by-sa/4.0/
[orig-template-authors]: https://github.com/fwalch/tum-thesis-latex/graphs/contributors
[orig-template-url]: https://github.com/fwalch/tum-thesis-latex
[sample-pdf]: https://raw.github.com/nnedkov/tum-thesis-latex/master/build/main.pdf
[template-download]: https://github.com/nnedkov/tum-thesis-latex/archive/master.zip
[tex-se]: https://tex.stackexchange.com/
[thesis-guidelines]: http://www.in.tum.de/en/current-students/administrative-matters/thesis-guidelines-and-topics.html
