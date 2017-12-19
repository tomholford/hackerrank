function addListItem(input) {
  var newListItem = document.createElement('li');
  newListItem.innerHTML = input;

  var listRoot = document.getElementById('list-display-root');
  listRoot.appendChild(newListItem);
}

function handleSubmitClick(e) {
  e.preventDefault();

  var listInputField = document.getElementById('list-input-field');
  var inputText = listInputField.value;
  if (!inputText || inputText === null || inputText === '') {
    return;
  }

  addListItem(inputText);

  listInputField.value = '';
}

document.addEventListener('DOMContentLoaded', function() {
  var listInputSubmit = document.getElementById('list-input-submit');
  listInputSubmit.addEventListener('click', handleSubmitClick)

  document.body.addEventListener('keyup', function(e) {
    if (e.keyCode == 13) {
      listInputSubmit.click();
    }
  });
})
