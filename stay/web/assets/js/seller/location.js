$("#homestay_location").click((e) => {
    showLocationModal();
})

function showLocationModal() {
    $("#locationModalCenter").modal("show");
}

var map = new AMap.Map("map_container", {
    resizeEnable: true
});

var geocoder = new AMap.Geocoder({
    city: "全国", //城市设为北京，默认：“全国”
});

var marker = new AMap.Marker();

function geoCode() {
    var address = document.getElementById('input_location').value;
    geocoder.getLocation(address, function (status, result) {
        console.log(address);
        if (status === 'complete' && result.geocodes.length) {
            var lnglat = result.geocodes[0].location
            console.log(lnglat);
            marker.setPosition(lnglat);
            map.add(marker);
            map.setFitView(marker);
            $("#homestay_lnglat").val(lnglat);
            $("#homestay_location").val(address);
        } else {
            console.error('根据地址查询位置失败');
        }
    });
}

document.getElementById("geo").onclick = geoCode;
document.getElementById('input_location').onkeydown = function (e) {
    if (e.keyCode === 13) {
        geoCode();
        return false;
    }
    return true;
};