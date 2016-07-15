# LaTeX template for TUM theses

This is a LaTeX template created according to the guidelines for TUM Informatics theses in SS 2016. **Always check the [current formatting guidelines][thesis-guidelines] before you hand in.** See [`build/main.pdf`][sample-pdf] for an example PDF created with this template.

Comments and contributions are welcome!

## Quickstart

 * Clone the repository (find the light green button in the top-right corner of this page). I strongly recommend using Git while you write your thesis as it's the only sane way to track changes in your files and keep multiple versions of your thesis.
 * For compiling use the bash script `helputils.sh`. Just execute `./helputils.sh 2` in a bash shell and happily edit your tex files. As soon as you save your changes, compilation will be triggered automatically. The script has the following dependencies: ... Resolve them by executing `sudo apt-get install ...`. The packages are quite big so stay patient.
 * Look for `TODO` comments in the provided files. Start with file `main.tex`.


If you have any problems with the template feel free to [create an issue][issue]. For general LaTeX questions use [TeX StackExchange][tex-se].

## Credits

This template is a modified (derived) version from [this template][orig-template-url]. The original authors are ([Florian Walch and other contributors][orig-template-authors]).

## Changes made

* The Makefile was substituted with the bash script `helputils.sh`. The script provides some useful additional functionality:
	1. List available options (use `./helputils.sh 1`):  
		Prints all available options provided by the script.
	2. Automatic compilation (use `./helputils.sh 2`):  
		The shell enters a blocking state. Every time a change is detected in any tex file the shell gets unblocked and triggers compilation. Keep in mind that file changes are detected only when they are saved to hard disk.
	3. Deletion of built files (use `./helputils.sh 3`):  
		Compilation generates a big number of log files in the build directory. This command cleans your build directory without deleting the produced pdf.
	4. Deletion of trailing whitespaces from tex, sh and bib files (use `./helputils.sh 4`):  
		Trailing whitespaces suck. They drive people crazy. They are parasites that eat up your disk space unnecessarily. If you happen to have digital OCD as I do this command will help you keep your sanity. Keep your files parasite-free!
	5. Updating bibliography (use `./helputils.sh 5`):  
		Unfortunately, updating your bibliography will require more than a single compilation. I don't know why this happens and I never got curious enough to find out. For performance reasons the automatic compilation will perform a single compilation. Hence, if you change the bib file and the pdf does not have the updated references use this command.
* I included the university and faculty logos in the `logos` directory. Unfortunately, Florian's template was pointing to invalid urls so in order to save you time finding them I added them directly in my repository. Additionally, the bash script for cropping the logos was omitted as they already have the appropriate shape.

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
