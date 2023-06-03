const carouselsWrapper  = document.querySelectorAll(".wrapper-caroursel");

carouselsWrapper.forEach(carouselWrapper =>{
    let caroursel = carouselWrapper.querySelector(".caroursel");
    let arrowBtns = carouselWrapper.querySelectorAll("i");
    let firstCardWidth = carouselWrapper.querySelector(".card").offsetWidth;
    arrowBtns.forEach(btn =>{
        btn.addEventListener("click",()=>{
            caroursel.scrollLeft += btn.id === "left" ? -firstCardWidth : firstCardWidth;
        })
    })
})

