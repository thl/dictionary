var clicked_url;
$(function(){
	$('a.thickbox')
		.unbind('click.url_fetcher')
		.bind('click.url_fetcher', function () { clicked_url = this.id; });
	
	$("#cancel_button").click(function () { tb_remove(); });

	$("#select_button").click(function () {
		$('#' + clicked_url + '_id').val($('#current_category_id').val());
		$('#' + clicked_url + '_name').html($('#current_category_title').val());
		$('#' + clicked_url).attr('href', $('#current_category_url').val());
		tb_remove();
	 });	
});