// //获取当前位置
// var geolocation = new BMap.Geolocation();
// geolocation.getCurrentPosition(function (r) {
//     if (this.getStatus() === BMAP_STATUS_SUCCESS) {
//         mk = new BMap.Marker(r.point);
//         getAddress(r.point);
//     } else {
//         alert('failed' + this.getStatus());
//     }
// });
//
// //获取地址信息，设置地址label
// function getAddress(point) {
//     var gc = new BMap.Geocoder();
//     gc.getLocation(point, function (rs) {
//         var addComp = rs.addressComponents;
//         console.log(addComp);
//         var address = addComp.province + addComp.city + addComp.district + addComp.street + addComp.streetNumber;//获取地址
//         console.log(address);
//         $("#house_location").val(address);
//     })
// }
//
$("#house_location").click((e) => {
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
            marker.setPosition(lnglat);
            map.add(marker);
            map.setFitView(marker);
            $("#house_lnglat").val(lnglat);
            $("#house_location").val(address);
        } else {
            log.error('根据地址查询位置失败');
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