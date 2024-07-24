// ----------------------------------------------------------------------------
// Init page
// ----------------------------------------------------------------------------
function init() {
    navitemsHandle();
    fillSecondSidebar();
    fillToc();
    slidemodeHandle();
    document.onkeyup = function (e) {
        if (e.key == "ArrowRight") {
            keyUpSlide("r");
        }
        if (e.key == "ArrowLeft") {
            keyUpSlide("l");
        }
    }
}

// ----------------------------------------------------------------------------
// Slide navigation
// ----------------------------------------------------------------------------
let gvarSlideset;
let gvarNoOfSlides

function setSlideset(slideset) {
    // console.log(`slideset: ${slideset}`);
    gvarSlideset = slideset;
}

function setNoOfSlides(noOfSlides) {
    // console.log(`noOfSlides: ${noOfSlides}`);
    gvarNoOfSlides = noOfSlides;
}

function getSlideNo() {
    let slideno = localStorage.getItem(gvarSlideset);
    slideno = (slideno == null) ? 0 : slideno
    return parseInt(slideno);
}

function setSlideNo(slideno) {
    // console.log(`setSlideNo: ${slideno}`);
    localStorage.setItem(gvarSlideset, slideno);    
}

function keyUpSlide(dir) {
    // console.log(`keyUpSlide: ${dir}`);
    console.log(`slidemodeIsOn: ${slidemodeIsOn()}`);
    if (!slidemodeIsOn()) {
        return;
    }

    const slideno = getSlideNo()
    if (dir == "r") {
        if (slideno < gvarNoOfSlides) {
            setSlideNo(slideno + 1);
        } else {
            setSlideNo(0);
        }
    } else {
        if (slideno == 0) {
            setSlideNo(gvarNoOfSlides);
        } else {
            setSlideNo(slideno - 1);
        }
    }

    renderButtonActivation();
}

function activateButton(i) {
    // console.log(`btn: ${i}`);
    setSlideNo(i)
    renderButtonActivation();
}

function renderButtonActivation() {
    const slideno = getSlideNo()

    // remove all activations
    const icActive = Array.from(document.getElementsByClassName("ic-active"));
    icActive.forEach(e => {
        e.className = e.className.replace(" ic-active", "");
    });

    const btn = document.getElementById("btn-" + slideno);
    btn.className += " ic-active";

    location.href = `#${slideno}`;
}



// ----------------------------------------------------------------------------
// Slidemode
// ----------------------------------------------------------------------------
function slideModeSetOn() {
    localStorage.setItem('slidemode', 1);
    slidemodeHandle();
}

function slideModeSetOff() {
    localStorage.setItem('slidemode', 0);
    slidemodeHandle();
}

function slidemodeIsOn() {
    const slidemode = localStorage.getItem('slidemode');
    return slidemode == 1;
}

function slidemodeHandle() {
    if (slidemodeIsOn()) {
        w3.show("#btn-slidemode-on");
        w3.hide("#btn-slidemode-off");
        w3.show(".ic-gap");
    } else {
        w3.show("#btn-slidemode-off");
        w3.hide("#btn-slidemode-on");
        w3.hide(".ic-gap");
    }
}

// ----------------------------------------------------------------------------
// Navigation Levels 
// ----------------------------------------------------------------------------
function setNavLevel1() {
    setNavitemOff('L2');
    navitemsHandle();
}

function setNavLevel2() {
    setNavitemOn('L2');
    setNavitemOff('L3');
    navitemsHandle();
}

function setNavLevel3() {
    setNavitemOn('L2');
    setNavitemOn('L3');
    setNavitemOff('L4');
    navitemsHandle();
}

function setNavLevel4() {
    setNavitemOn('L2');
    setNavitemOn('L3');
    setNavitemOn('L4');
    navitemsHandle();
}

function isNavitemIsOff(id) {
    const navItem = localStorage.getItem(id);
    return (navItem == null || navItem == 0);
}

function setNavitemOff(id) {
    localStorage.setItem(id, 0);
}

function setNavitemOn(id) {
    localStorage.setItem(id, 1);
}

function navitemsHandle() {
    for (let i = 0; i < localStorage.length; i++) {
        let id = localStorage.key(i);
        if (isNavitemIsOff(id)) {
            w3.hide(`.${id}`);
        } else {
            w3.show(`.${id}`);
        }
    }
}

// ----------------------------------------------------------------------------
// Sidebars
// ----------------------------------------------------------------------------

function toggleSidebar(sbId, ovlId) {
    const sb = document.getElementById(sbId);
    const ovl = document.getElementById(ovlId);
    if (sb.style.display === 'block') {
        sb.style.display = 'none';
        ovl.style.display = "none";
    } else {
        sb.style.display = 'block';
        ovl.style.display = "block";
    }
}

function openSidebar(sbId, ovlId) {
    w3.hide("sb1");
    const sb = document.getElementById(sbId);
    const ovl = document.getElementById(ovlId);
    sb.style.display = "block";
    ovl.style.display = "block";
}

function closeSidebar(sbId, ovlId) {
    const sb = document.getElementById(sbId);
    const ovl = document.getElementById(ovlId);
    sb.style.display = "none";
    ovl.style.display = "none";
}

function fillSecondSidebar() {
    const children = Object.entries(document.getElementById("ct").childNodes);
    const headers = children.filter(a => a[1].nodeName[0] === "H").map(a => [a[1].textContent, a[1].id])
    const sb2cont = document.getElementById('sb2cont');
    headers.forEach(h => {
        const p = document.createElement("p");
        const a = document.createElement("a");
        a.href = "#" + h[1];
        a.innerText = h[0];
        p.appendChild(a);
        sb2cont.appendChild(p);
    });
}

// ----------------------------------------------------------------------------
// Table of contents for slides
// ----------------------------------------------------------------------------
function fillToc() {
    // executed only for slides
    const tocCont = document.getElementById('toc');
    if (tocCont == null) {
        return
    }
    const children = Object.entries(document.getElementById("ct").childNodes);
    const headers = children.filter(x => x[1].tagName === "H1").map(a => a[1].textContent);
    let i = 1;
    headers.forEach(h => {
        const btn = document.createElement("button");
        const br = document.createElement("br");
        btn.textContent = h;
        btn.classList.add("w3-button")
        btn.classList.add("w3-padding-small")
        btn.addEventListener('click', makeClickCallback(i));
        tocCont.appendChild(btn);
        tocCont.appendChild(br);
        i = i + 1;
    });
}

function clickTocBtn(i) {
    // console.log(`#${i}`)
    window.location.href = `#${i}`;
    const slideBtn = document.getElementById(`btn-${i}`);
    activateButton(slideBtn);
}

function makeClickCallback(i) {
    return function () {
        clickTocBtn(i);
    };
}
