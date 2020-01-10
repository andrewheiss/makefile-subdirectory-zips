TO_ZIP_DIRS = $(filter %/, $(wildcard static/projects/*/))  # Find all directories in static/projects
TO_ZIP_NAMES = $(patsubst %/,%,$(TO_ZIP_DIRS))  # Remove trailing /
ZIP_TARGETS = $(addsuffix .zip,$(TO_ZIP_NAMES))  # Add .zip

.SECONDEXPANSION:

$(ZIP_TARGETS): %.zip : $$(shell find % -type f ! -path "%/.*")
	cd $(basename $@)/.. && zip -FSr $(notdir $@) $(notdir $(basename $@)) -x $(notdir $(basename $@))/.\*

zip_projects: $(ZIP_TARGETS)
