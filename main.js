// ----------------------------------------------------------------------------
// Global strings
// ----------------------------------------------------------------------------
const keyPrefix = "ichp"
const allPages = "all"

// ----------------------------------------------------------------------------
// Init page
// ----------------------------------------------------------------------------
function init() {
    document.addEventListener("visibilitychange", handleVisibilityChange)
    navLevelHandle();
    fillSecondSidebar();
    // fillToc();
    if (slideIsOn()) {
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
}

// ----------------------------------------------------------------------------
// Visibility Change - for Tab Switch
// ----------------------------------------------------------------------------
function handleVisibilityChange() {
    // const slidesetOld = getSlideset();
    // const slidesetNew = nameFromHref();
    if (document.hidden) {
        console.log(`hidden - ${nameFromHref()}`);
    } else {
        console.log(`visible - ${nameFromHref()}`);
        // setSlideset(slidesetNew);
        // setNoOfSlides(getNoOfSlides());       
    }
  }

function nameFromHref() {
    const url = window.location.href; 
    // Get last part of url
    const filename = url.substring(url.lastIndexOf('/') + 1);
    // Get basename, assume filename has extension .html
    const baseFilename = filename.substring(0, filename.lastIndexOf('.')) 
    return baseFilename;
}


// ----------------------------------------------------------------------------
// State storage handling
// ----------------------------------------------------------------------------
function stateSet(funcName, pageName, varName, val) {
    const key = `${keyPrefix}-${pageName}-${varName}`;
    console.log(`stateSet: ${funcName}|${key}|${val}`);
    localStorage.setItem(key, val);
}

function stateGet(funcName, pageName, varName) {
    const key = `${keyPrefix}-${pageName}-${varName}`;
    const val = localStorage.getItem(key);
    console.log(`stateGet: ${funcName}|${key}|${val}`);
    return val;
}


// ----------------------------------------------------------------------------
// State management
// ----------------------------------------------------------------------------

// Slides ---------------------------------------------------------------------
function slideSetOn() {
    stateSet("slideSetOn", nameFromHref(), "slide", 1);
    // localStorage.setItem("ichp-slide", 1);
}

function slideSetOff() {
    stateSet("slideSetOff", nameFromHref(), "slide", 0);
    // localStorage.setItem("ichp-slide", 0);
}

function slideIsOn() {
    const slide = stateGet("slideIsOn", nameFromHref(), "slide");
    // const slide = localStorage.getItem('ichp-slide');
    // null is regarded as off
    return slide == 1;
}

// Slide mode -----------------------------------------------------------------
function slideModeSetOn() {
    stateSet("slideModeSetOn", nameFromHref(), "slidemode", 1);
    // localStorage.setItem("slidemode", 1);
    slidemodeHandle();
}

function slideModeSetOff() {
    stateSet("slideModeSetOff", nameFromHref(), "slidemode", 0);
    // localStorage.setItem("slidemode", 0);
    slidemodeHandle();
}

function slidemodeIsOn() {
    const slidemode = stateGet("slidemodeIsOn", nameFromHref(), "slidemode");
    // const slidemode = localStorage.getItem('slidemode');
    // null is regarded as off
    return slidemode == 1;
}

// Navigation levels ----------------------------------------------------------
function setNavLevel(level) {
    stateSet("setNavLevel", allPages, "nav-level", level);
    // localStorage.setItem("ichp-nav-level", level);
    navLevelHandle();
}

function getNavLevel() {
    const navLevel = stateGet("getNavLevel", allPages, "nav-level");
    // const navLevel = localStorage.getItem("ichp-nav-level");
    return (navLevel == null) ? 4 : parseInt(navLevel);
}

// Slide set ------------------------------------------------------------------
function setSlideset(slideset) {
    // console.log(`setSlideset: ${slideset}`)
    localStorage.setItem("ichp-slideset", slideset);
}

function getSlideset() {
    const slideset = localStorage.getItem("ichp-slideset");
    return (slideset == null) ? "none" : slideset;
    // console.log(`getSlideset: ${slideset}`)
}

// Slide numbers --------------------------------------------------------------
function setNoOfSlides(noOfSlides) {
    stateSet("setNoOfSlides", nameFromHref(), "noOfSlides", noOfSlides);
    // localStorage.setItem("ichp-noOfSlides", noOfSlides);
}

function getNoOfSlides() {
    const noOfSlides = stateGet("getNoOfSlides", nameFromHref(), "noOfSlides");
    // const noOfSlides = parseInt(localStorage.getItem("ichp-noOfSlides"));
    return (noOfSlides == null) ? 1 : parseInt(noOfSlides);
}

// Current slide numbers ------------------------------------------------------
function setCurrentSlideNo(slideNo) {
    stateSet("setCurrentSlideNo", nameFromHref(), "slideno", slideNo);
    // const slideset = getSlideset()
    // localStorage.setItem(`ichp-${slideset}-slideno`, slideNo);
}

function getCurrentSlideNo() {
    const slideNo = stateGet("getCurrentSlideNo", nameFromHref(), "slideno");
    // const slideset = getSlideset()
    // const slideNo = localStorage.getItem(`ichp-${slideset}-slideno`);
    return (slideNo == null) ? 1 : parseInt(slideNo);
}


// ----------------------------------------------------------------------------
// Slide navigation
// ----------------------------------------------------------------------------
function keyUpSlide(dir) {
    // console.log(`keyUpSlide: ${dir}`);
    if (!slideIsOn()) {
        return;
    }

    const slideNo = getCurrentSlideNo();
    const noOfSlides = getNoOfSlides()
    if (dir == "r") {
        if (slideNo < noOfSlides) {
            setCurrentSlideNo(slideNo + 1);
        } else {
            setCurrentSlideNo(1);
        }
    } else {
        if (slideNo == 1) {
            setCurrentSlideNo(noOfSlides);
        } else {
            setCurrentSlideNo(slideNo - 1);
        }
    }

    renderButtonActivation();
}

function activateButton(i) {
    // console.log(`activateButton: ${i}`);
    setCurrentSlideNo(i)
    renderButtonActivation();
}

function renderButtonActivation() {
    const slideNo = getCurrentSlideNo()
    // console.log(`renderButtonActivation: slideNo: ${slideNo}`);

    // remove all activations
    const icActive = Array.from(document.getElementsByClassName("ic-active"));
    icActive.forEach(e => {
        e.className = e.className.replace(" ic-active", "");
    });

    const btn = document.getElementById("btn-" + slideNo);
    const btnn = document.getElementById("btnn-" + slideNo);
    btn.className += " ic-active";
    btnn.className += " ic-active";

    location.href = `#${slideNo}`;
}



// ----------------------------------------------------------------------------
// Slide mode
// ----------------------------------------------------------------------------
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
// Navigation handling 
// ----------------------------------------------------------------------------
function navLevelHandle() {
    const navLevels = ["L1", "L2", "L3", "L4"]
    const navLevel = getNavLevel();
    navLevels.forEach(l => { w3.show(`.${l}`); });
    w3.hide(`.${navLevels[navLevel]}`);
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
    const tocCont = document.getElementById('toc1');
    if (tocCont == null) {
        return
    }
    const children = Object.entries(document.getElementById("ct").childNodes);
    const headers = children.filter(x => x[1].tagName === "H1").map(a => a[1].textContent);
    let i = 1;
    headers.forEach(h => {
        const btn = document.createElement("button");
        const br = document.createElement("br");
        btn.id = `btnn-${i}`
        btn.textContent = `${i.toString().padStart(2, "0")}: ${h}`;
        btn.classList.add("w3-button")
        btn.classList.add("w3-padding-small")
        btn.addEventListener('click', makeClickCallback(i));
        tocCont.appendChild(btn);
        tocCont.appendChild(br);
        i = i + 1;
    });
}

function clickTocBtn(i) {
    // console.log(`clickTocBtn: ${i}`)
    window.location.href = `#${i}`;
    activateButton(i);
}

function makeClickCallback(i) {
    return function () {
        clickTocBtn(i);
    };
}
