$(document).ready(function() {
  bindEvents();
});


function bindEvents() {
  $("#sign-in").on('submit', signIn)
  $('#sign-up').on('click', signUp)
  $("#create-user").on('submit', createUser)
  $("#sign-out").on('click', signOut)
  $("#search").on('submit', popUp)
}

function signIn(e) {
  e.preventDefault()
  var ajaxRequest = $.ajax({
    url:'/sign_in',
    type: 'POST',
    data: $(this).serialize()
    }
  )
  ajaxRequest.done(function(name){
    $("input[type='text']").val("")
    $("input[type='password']").val("")
    // $('#sign-up').css('visibility', 'hidden')
    // $('#sign-out').css('visibility', 'visible')
    $('#create-user').css('visibility', 'hidden')
    $('#search').css('visibility', 'visible')
    $('sign-in').css('visibility', 'visible')

  })
  ajaxRequest.fail(function(){
    console.log("fail!")
  })
}

function signUp(e) {
  e.preventDefault()
  var ajaxRequest = $.ajax({
    url:'/sign_up',
    type: 'GET',
    }
  )
  ajaxRequest.done(function(){
    $('#create-user').css('visibility', 'visible')
    })
  ajaxRequest.fail(function(){
    console.log("fail!")
  })
}

function createUser(e) {
  e.preventDefault()
  var ajaxRequest = $.ajax({
    url:'/create_user',
    type: 'POST',
    data: $(this).serialize()
    }
  )
  ajaxRequest.done(function(){
    $("input[type='text']").val("")
    $("input[type='password']").val("")
    // $('#sign-up').css('visibility', 'hidden')
    // $('#sign-out').css('visibility', 'visible')
    $('#create-user').css('visibility', 'hidden')
    $('#search').css('visibility', 'visible')

    })
  ajaxRequest.fail(function(){
    console.log("fail!")
  })
}

function signOut(e) {
  e.preventDefault()
  var ajaxRequest = $.ajax({
    url:'/sign_out',
    type: 'GET',
    }
  )
  ajaxRequest.done(function(){
    })
    $("input[type='text']").val("")
    $("input[type='password']").val("")
    // $('#sign-up').css('visibility', 'visible')
    // $('#sign-out').css('visibility', 'hidden')
    $('#search').css('visibility', 'hidden')


  ajaxRequest.fail(function(){
    console.log("fail!")
  })
}


function popUp(e) {
  e.preventDefault()
  var ajaxRequest = $.ajax({
    url:'/search_term',
    type: 'POST'
    })

  ajaxRequest.done(function(){
    })

  $('.container').prepend("<div id='block'></div>")


  ajaxRequest.fail(function(){
    console.log("fail!")
  })
}

