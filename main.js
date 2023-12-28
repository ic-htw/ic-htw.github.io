function init() {
    navitemsHandle();
    slideModeSetOn();
    fillSecondSidebar();
    deactivateButton();
    // window.location.href = "#1"
}

function activateButton(btn) {
    const icActive = document.getElementsByClassName("ic-active");
    if (icActive.length > 0) { 
        icActive[0].className = icActive[0].className.replace(" ic-active", "");
    }
    btn.className += " ic-active";
    // console.log(btn.textContent)
}

function deactivateButton() {
    const icActive = document.getElementsByClassName("ic-active");
    if (icActive.length > 0) { 
        icActive[0].className = icActive[0].className.replace(" ic-active", "");
    }
}

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
        w3.show(".ic-gap");
    } else {
        w3.hide(".ic-gap");
    }
}


function navitemToggle(id) {
    console.log(id);
    if (isNavitemIsOff(id)) {
        console.log("was off");
        setNavitemOn(id);
    } else {
        console.log("was on");
        setNavitemOff(id);
    }
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

function setAllNavitemsOff() {
    setNavitemOff('ADBKT');
    setNavitemOff('DataMan');
    setNavitemOff('DbTech');
    setNavitemOff('DMDB');
    setNavitemOff('PBI');
    setNavitemOff('AAA');
    setNavitemOff('DBS');
    setNavitemOff('ML');
    setNavitemOff('PROG');
    navitemsHandle();
}

function setAllNavitemsOn() {
    setNavitemOn('ADBKT');
    setNavitemOn('DataMan');
    setNavitemOn('DbTech');
    setNavitemOn('DMDB');
    setNavitemOn('PBI');
    setNavitemOn('AAA');
    setNavitemOn('DBS');
    setNavitemOn('ML');
    setNavitemOn('PROG');
    navitemsHandle();
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

function fillSecondSidebar() {
    const children = Object.entries(document.getElementById("ct").children);
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


