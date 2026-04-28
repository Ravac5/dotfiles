function getExtension(fileName) {
    return fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
}

function isVideo(fileName, filterVideos) {
    return filterVideos.indexOf(getExtension(fileName)) !== -1;
}

function isImage(fileName, filterImages) {
    return filterImages.indexOf(getExtension(fileName)) !== -1;
}

function thumbnailName(fileName, filterVideos) {
    return isVideo(fileName, filterVideos) ? fileName.substring(0, fileName.lastIndexOf(".")) + ".jpg" : fileName;
}

function matchesFilter(fileName, selectedFilter, filterImages, filterVideos) {
    if (selectedFilter === "all") return true;
    if (selectedFilter === "images") return isImage(fileName, filterImages);
    if (selectedFilter === "videos") return isVideo(fileName, filterVideos);
    return false;
}

function nameFilters(filterImages, filterVideos) {
    return (filterImages || []).concat(filterVideos || []).map((ext) => "*." + ext);
}
