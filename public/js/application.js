$(document).ready(function() {
	showNewUserForm();
	showEditUserForm();
	logoutHandler();
	showLoginForm();
});

var showNewUserForm = function() {
	$('body').on('click', '#show_new_user_form', function(event) { 
		event.preventDefault();
		var response = $.ajax({
			method: 'GET',
			url: '/users/new'
		});
		response.done(function(data) { 
			$('.show_form').append(data);
		});
	});
}

var showEditUserForm = function() { 
	$('body').on('click', '#show_edit_user_form', function(event) { 
		event.preventDefault();
		var userId = $(this).attr('href').match(/\d+/) 
		var response = $.ajax({
			method: 'GET',
			url: '/users/' + userId + '/edit'
		});
		response.done(function(data){ 
			$('.show_form').append(data);
		});
	});
}

var showLoginForm = function() { 
	$('body').on('click', '#show_log_in_form', function(event) { 
		event.preventDefault(); 
		var response = $.ajax({
			method: 'GET',
			url: '/sessions/new'
		});
		response.done(function(data){
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
