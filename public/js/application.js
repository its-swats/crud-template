$(document).ready(function() {
	formHandler();
	logoutHandler();
	deleteAccountHandler();
});

var formHandler = function() {
	$('body').on('click', '.popup_form', function(event) {
		event.preventDefault();
		var targetUrl = $(this).attr('href')
		var response = $.ajax({
			method: 'GET',
			url: targetUrl
		});
		response.done(function(data) {
			clearForms();
			$('.show_form').append(data);
		});
	});
}

var logoutHandler = function() {
	$('body').on('click', '#log_out', function(event) {
		event.preventDefault();
		var userId = $(this).attr('href').match(/\d+/)
		var response = $.ajax({
			method: 'DELETE',
			url: '/sessions/' + userId
		});
		response.done(function() {
			location.reload();
		});
		response.fail(function() {
			console.log('Logout Failed');
		});
	});
}

var deleteAccountHandler = function() {
	$('.show_form').on('click', 'form button#delete_account', function(event) {
		var userId = $(this).parent().attr('action').match(/\d+/)
		event.preventDefault();
		var response = $.ajax({
			type: 'DELETE',
			url: '/users/' + userId
		});
		response.done(function() {
			location.reload();
		});
	});
}

var clearForms = function () {
	$('.show_form').empty();
}

