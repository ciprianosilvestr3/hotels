
$.fn.serializeObject = function() {
        var o = {};
        var a = this.serializeArray();
        $.each(a, function() {
            if (o[this.name]) {
                if (!o[this.name].push) {
                    o[this.name] = [o[this.name]];
                }
                o[this.name].push(this.value || '');
            } else {
                o[this.name] = this.value || '';
            }
        });
        return o;
    };



function peticiones(method,url,datatype,data,funcionsuccess,funcionerror)
{

	$.ajax({
  method: method,
  url: url,
  dataType: datatype,
  data: data,
  success: funcionsuccess,
  error:funcionerror
});
}


var mierror = function (jqXHR, textStatus, errorThrown) {
                  if (jqXHR.status == 500) {
                      alert('Internal error: ' + jqXHR.responseText);
                  } else {
                      alert('Unexpected error.');
                  }
              }




peticiones('GET',base_url+'index.php/inicio/menu','JSON',$('#sinnombre').serializeObject(),function(data)
	{
$('#ulmenu').html(data.menu);
console.log(data.menu);

	},mierror);






