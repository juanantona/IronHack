var track;

function getTrack () {
    var url = 'https://api.spotify.com/v1/search?q=';
    var track_name = $("#track").val().replace(" ", "%20");
    var urlsearch = url + track_name + "&type=track&limit1"; 
    var request = $.get(urlsearch);
     
    function showTrack (responseAPI) 
    {
        track = responseAPI["tracks"]["items"][0];
        var artist = track.artists[0].name;
        //console.log(track);
        //console.log(artist);

        var html = [
               '<h4> Track: ' + track.name + '</h4>',
               '<dl>',
               'Artist: ' + '<button id="getDataArtist" class="btn btn-primary btn-md" data-toggle="modal" data-target="#myModal">' + artist + '</button>',
               '</dl>'
            ].join('\n');

        var newLi = document.createElement('li');
           newLi.innerHTML = html;
           
        document.querySelector('.js-track').appendChild(newLi);
        
        var newAudio = document.createElement('audio');
            newAudio.className = "js-player";
            newAudio.src = track.preview_url;
            newAudio.controls = true;
        
        document.querySelector('.js-player-box').appendChild(newAudio);

        document.querySelector('.js-play-track').removeAttribute('disabled');

    }

    function handleError (err1, err2, err3) 
    {
      console.error('OH NO!!', err1, err2, err3);
    }

    request.done(showTrack);
    request.fail(handleError);     
}

$('.js-get-track').on('click', getTrack);

function play(){

   if ($('.js-play-track').hasClass('playing'))
   {
      $('.js-play-track').removeClass('playing');
      $('.js-player').trigger('pause');
   }
   else
   {
      $('.js-player').on('timeupdate', printTime);
      $('.js-player').trigger('play');
      $('.js-play-track').addClass('playing');
   }   
}

$('.js-play-track').on('click',play);

function printTime() 
{
  var current = $('.js-player').prop('currentTime');
  var slider = document.getElementById('slider');

  slider.value = (current*10000).toString();
  slider.max = track["duration_ms"].toString();
}




$('#getDataArtist').on('click', getDataArtist);

function getDataArtist() 
{
  console.log("hi");
}





// function getSongs(id){

// console.log("My id is: "+id);

//   var url = 'https://api.spotify.com/v1/artists/';
//   var urlsearch = url + id + "/top-tracks?country=SE";
//   console.log(urlsearch);
//   var request = $.get(urlsearch);

//   function showTracks (responseAPI) {
//         var tracks = responseAPI["tracks"];
//         console.log(tracks);
         
//         tracks.forEach(function appendLi (track) {

//           var html = [
//               '<h4>' + 'Tracks' + '</h4>',
//               '<dl>',
//               '<dt>Track:</dt>',
//               '<dd>' + track["name"] + '</dd> ',
//               '</dl>'
//           ].join('\n');

//           var otherLi = document.createElement('li');
//           otherLi.innerHTML = html;
//           document.querySelector('.js-track_list').appendChild(otherLi);
//         });
             
//     }

//     function handleError (err1, err2, err3) {
//       console.error('OH NO!!', err1, err2, err3);
//     }

//     request.done(showTracks);
//     request.fail(handleError);
 
// };

