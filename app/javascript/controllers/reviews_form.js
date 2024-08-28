// function starsReducer(state, action) {
//   switch (action.type) {
//     case 'HOVER_STAR': {
//       return {
//         starsHover: action.value,
//         starsSet: state.starsSet
//       }
//     }
//     case 'CLICK_STAR': {
//       return {
//         starsHover: state.starsHover,
//         starsSet: action.value
//       }
//     }
//       break;
//     default:
//       return state
//   }
// }

// var StarContainer = document.getElementById('rating');
// var StarComponents = StarContainer.children;

// var state = {
//   starsHover: 0,
//   starsSet: 4
// }

// function render(value) {
//   for(var i = 0; i < StarComponents.length; i++) {
//     StarComponents[i].style.fill = i < value ? '#f39c12' : '#808080'
//   }
// }

// for (var i=0; i < StarComponents.length; i++) {
//   StarComponents[i].addEventListener('mouseenter', function() {
//     state = starsReducer(state, {
//       type: 'HOVER_STAR',
//       value: this.id
//     })
//     render(state.starsHover);
//   })

//   StarComponents[i].addEventListener('click', function() {
//     state = starsReducer(state, {
//       type: 'CLICK_STAR',
//       value: this.id
//     })
//     render(state.starsHover);
//   })
// }

// StarContainer.addEventListener('mouseleave', function() {
//   render(state.starsSet);
// })

// var review = document.getElementById('review');
// var remaining = document.getElementById('remaining');
// review.addEventListener('input', function(e) {
//   review.value = (e.target.value.slice(0,999));
//   remaining.innerHTML = (999-e.target.value.length);
// })

// var form = document.getElementById("review-form")

// form.addEventListener('submit', function(e) {
//   e.preventDefault()
//   let formData = new FormData();
//   formData.append('rating', state.starsSet);
//   formData.append('review', form['review'].value);
//   console.log(formData)
//   const meta = document.querySelector('meta[name=csrf-token]');
//   const token = meta && meta.getAttribute('content');

//   fetch(form.action, {
//       body: formData,
//       method: "post",
//       headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'X-CSRF-Token': token,
//       },
//   });
// })
