window.client = new Faye.Client('/faye')

client.addExtension {
  outgoing: (message, callback) ->
    message.ext = message.ext || {}
    message.ext.csrfToken = $('meta[name=csrf-token]').attr('content')
    callback(message)
}
 
jQuery ->
  client.subscribe '/posts', (payload) ->
    $('#posts').find('.posts-list').prepend(payload.message) if payload.message

	$('#new_post').submit -> $(this).find("input[type='submit']").val('Sending...').prop('disabled', true)