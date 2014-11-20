window.client = new Faye.Client('/faye')
 
jQuery ->
  client.subscribe '/posts', (payload) ->
    $('#posts').find('.posts-list').prepend(payload.message) if payload.message

	$('#new_post').submit -> $(this).find("input[type='submit']").val('Sending...').prop('disabled', true)