const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

// Input Number Quantity
const up = $('.qty-up');
const down = $('.qty-down');
const num = $('.input-number input');

let a = 1;

up.addEventListener('click', () => {
    num.value = parseInt(num.value) + 1;
});

down.addEventListener('click', () => {
    if (parseInt(num.value) > parseInt(num.min)) {
        num.value = parseInt(num.value) - 1;
    }
});
