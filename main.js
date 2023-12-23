function init() {
    navitemsHandle();
    slideModeSetOn();
    sr_fill();
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

// Fill Right Sidebar 
function sr_fill() {
    const children = Object.entries(document.getElementById("ct").children);
    const headers = children.filter(a => a[1].nodeName[0] === "H").map(a => [a[1].textContent, a[1].id])
    const sr = document.getElementById('sr');
    headers.forEach(h => {
        const p = document.createElement("p");
        const a = document.createElement("a");
        a.href = "#" + h[1];
        a.innerText = h[0];
        p.appendChild(a);
        // sr.appendChild(p);
        srr.appendChild(p);
    });
}

function openSrr() {
    document.getElementById("srr").style.display = "block";
}

function closeSrr() {
    document.getElementById("srr").style.display = "none";
}

// Scrap  -----------------------------------------
function navitem_toggle1(id) {
    // w3.toggleShow(`#${id}`)
    const x = document.getElementById(id);
    if (x.className.indexOf("ic-on") == -1) {
        x.className = x.className.replace(" ic-off", "");
        x.className += " ic-on";
    } else {
        x.className = x.className.replace(" ic-on", "");
        x.className += " ic-off";
    }
    w3.show(".ic-on")
    w3.hide(".ic-off")
}

function accordion1(id) {
    const x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else {
        x.className = x.className.replace(" w3-show", "");
    }
}

