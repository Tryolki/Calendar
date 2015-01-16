$(document).ready(
function load() {
    var table = $("#clnd")[0];
    if (table != null) {
        for (var i = 0; i < table.rows.length; i++) {
            for (var j = 0; j < table.rows[i].cells.length; j++)
                table.rows[i].cells[j].onclick = function () {
                    k = $(this).text().split("date")
                    set_img(k[1]);
                };
        }
    }
    $("#search_placeholder").keyup(function (e) {
        if (e.keyCode == 13) {
            var cel = $('#search_placeholder').val();
            var det = $('#Search_user').text();
            window.open(det +"?search_user="+cel, 'Image_date');
        }
    });
});

function new_image(cel){
        var det = $("#New_user_image").text();
        window.open(det +"?date="+cel, 'Image_date');
}

function set_img(cel) {
    var det = $("#Show_user_gallery").text();
    window.open(det +"?date="+cel, 'Image_date');
}
