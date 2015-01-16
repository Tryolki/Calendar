function previewImage(el,widths,limit){
    var files = el.files;
    var output = $('.imagePreview')[0];
    var allowedTypes = ['JPG','JPEG','GIF','PNG','SVG','WEBP'];
    $('.imagePreview').append('<p> </p>').text("Загружаю..");
    var file = files[0];
    var imageType = /image.*/;
    //Определить устройство пользователя, в случае чего вывести сообщение об ошибке
    var device = detectDevice();
    if (!file.type.match(imageType)) {
         $('.imagePreview').append('<p> </p>').text("Не изображение");
        return false;
    }

    var img='';
    var reader = new FileReader();
    reader.onload = (function(aImg) {
        return function(e) {
            output.innerHTML='';
            //Выполнить форматирование по нашим параметрам и после создать тег с изображением(можно добавить описание)
            var format = e.target.result.split(';');
            format = format[0].split('/');
            format = format[1].split('+');
            format = format[0].toUpperCase();
            if (device.android){
                format = file.name.split('.');
                format = format[format.length-1].split('+');
                format = format[0].toUpperCase();
            }
            //создать img с параметрами выше
            if (allowedTypes.indexOf(format)>=0 && e.total<(limit*1024*1024)){
                for (var size in widths){
                    var image = $("<img>")[0];
                    var src = e.target.result;
                    image.src = src;
                    image.width = widths[size];
                    image.title = 'Image  '+widths[size]+'px';
                    output.appendChild(image);
                }
            }
            output.appendChild(description);
        };
    })(img);
    reader.readAsDataURL(file);
}
//Определить устройство
function detectDevice(){
    var ua = navigator.userAgent;
    var brand = {
        apple: ua.match(/(iPhone|iPod|iPad)/),
        blackberry: ua.match(/BlackBerry/),
        android: ua.match(/Android/),
        microsoft: ua.match(/Windows Phone/),
        zune: ua.match(/ZuneWP7/)
    }

    return brand;
}
