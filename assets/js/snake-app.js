(() => {
    const key = "A";
    const thresholds = [3, 17, 50, 100, 500];
    const cardNames = ["LENGUA","REGADERA","FRUCTWIN","PLUMA","HERBICIDA","CHAMPIÑÓN","MECHERO","POCIÓN NARANJA","REGALIZ","CROISSANT","SALIDA","ANKH","JERINGUILLA","MASACRE","PIRATA","VENENO","BOMBA","CINTURÓN","ARDILLA","SONRISA","CHINCHETA","PATINES","RELOJ DE ARENA","DISYUNTOR","GUSANO","MURCIÉLAGO","PANTUFLA","CARAMELO","NUBE","ANILLO","TIJERAS GIGANTES","TIJERAS","CARRETILLA","TAPIS","ESPADA","SORPRESA","RELOJ","ESPONJA","PIPA","RUBÁN","LANA","TARRO DE MIEL","ESCÁNER","HOJA","LUPA","ESCOBA","MOLINO PEQUEÑO","VELA","PIMIENTA","SAL","PAÑUELO","DETONADOR","MOLINO GRANDE","CUCHARÓN","CASCABEL","CRONO","AMPLI","QUESO","PELOTA TENIS","RESORTE","LLAVE INGLESA","DESATASCADOR","SIERRA","BOTAS","ÍDOLO","PICO","CALDERO","SOMBRERO MAGO","LAZO","BOLA CRISTAL","POCIÓN AZUL","POCIÓN ROJA","POCIÓN ROSA","CUBO","ENTRENAMIENTO","DELFÍN","BATERÍA","INVERNADERO","ALTAVOZ","ESTEROIDES","HAMBURGUESA","CACA","IMÁN","POLVOS MÁGICOS","BRANDY","FRENO","GLOBO","KAZOO","CÁSCARA HUEVO","VDGC","RECICLAJE","MOSTAZA","FERTILIZANTE","RUNA VITAMINA","RUNA ESBELTA","RUNA FUERTE","KETCHUP","GLOTIS","EMBUDO","CIRUELA","JABÓN","FANTASMA","TORO","NAVIDAD","GALAXIA","POCIÓN VERDE","POCIÓN AMARILLA","AGUJERO NEGRO","ARCO IRIS","AS DE PICAS","ESPINAS","ÉXTASIS","PARANOIA","MARTILLO","RUNA FLORA","HORMIGÓN","RECOMPENSA","BATIDORA","CANDADO","CALCETINES","COFRE PEQUEÑO","VIRUS","HORMONAS","HENO","BANDERA","SOPA","FUEGO FATUO","OGM","BOICOT","NIEBLA","ESTRELLA FUGAZ"];

    let lastHandIds = [];

    function byId(id) {
        return document.getElementById(id);
    }

    function getDB() {
        try {
            const data = localStorage.getItem("snake_db");
            if (data) {
                const parsed = JSON.parse(data);
                if (parsed && parsed.fruits && parsed.matches) {
                    return parsed;
                }
            }
        } catch (error) {
            console.error("Error cargando DB:", error);
        }
        return { fruits: new Array(302).fill(0), matches: [] };
    }

    function saveDB(db) {
        try {
            localStorage.setItem("snake_db", JSON.stringify(db));
        } catch (error) {
            console.error("Error guardando DB:", error);
        }
    }

    function getFruitLevel(count) {
        for (let index = thresholds.length - 1; index >= 0; index -= 1) {
            if (count >= thresholds[index]) {
                return index + 1;
            }
        }
        return 0;
    }

    async function handleMuxxuRequest(url, body) {
        const requestUrl = url.toString();
        if (requestUrl.includes("/start")) {
            let handStr = "ah";
            try {
                const text = await new Response(body).text();
                const match = decodeURIComponent(text).match(/y6:_cards(a.*?h)/);
                if (match) {
                    handStr = match[1].replace(/jR\d+:/g, "jy9:_CardType:");
                    lastHandIds = (handStr.match(/:(\d+):/g) || []).map((value) => parseInt(value.replace(/:/g, ""), 10));
                }
            } catch (error) {
                console.error("Error interceptando /start:", error);
            }
            return key + "oy3:_idi1y6:_cards" + handStr + "y4:_gidi12345g";
        }

        if (requestUrl.includes("/end")) {
            try {
                const text = await new Response(body).text();
                const decoded = decodeURIComponent(text);
                const db = getDB();
                const fruitMatch = decoded.match(/y7:_fruitsa(.*?)h/);
                const progression = [];

                if (fruitMatch) {
                    const ids = (fruitMatch[1].match(/i\d+|z/g) || []).map((value) => value === "z" ? 0 : parseInt(value.substring(1), 10));
                    ids.forEach((id) => {
                        if (id < 302) {
                            const oldLevel = getFruitLevel(db.fruits[id]);
                            db.fruits[id] += 1;
                            const newLevel = getFruitLevel(db.fruits[id]);
                            if (newLevel > oldLevel) {
                                progression.push("oy3:_idi" + id + "y4:_lvli" + newLevel + "g");
                            }
                        }
                    });
                }

                const score = parseInt((decoded.match(/y6:_scorei(\d+)/) || [0, 0])[1], 10);
                const time = Math.floor(parseInt((decoded.match(/y3:_pti(\d+)/) || [0, 0])[1], 10) / 1000) + "s";
                db.matches.unshift({
                    date: new Date().toLocaleString(),
                    score,
                    cards: [...lastHandIds],
                    fruits: fruitMatch ? (fruitMatch[1].match(/i\d+|z/g) || []).length : 0,
                    time,
                });
                saveDB(db);
                updateUI();
                return key + "oy12:_progressiona" + progression.join("") + "hy4:_errzg";
            } catch (error) {
                console.error("Error interceptando /end:", error);
            }
            return key + "oy12:_progressionahy4:_errzg";
        }

        return null;
    }

    function installNetworkInterceptors() {
        if (window.__snakeInterceptorsInstalled) {
            return;
        }

        window.__snakeInterceptorsInstalled = true;
        const originalFetch = window.fetch.bind(window);
        const originalOpen = XMLHttpRequest.prototype.open;
        const originalSend = XMLHttpRequest.prototype.send;

        window.fetch = async (input, init) => {
            const requestUrl = input instanceof Request ? input.url : input.toString();
            if (requestUrl.includes("/start") || requestUrl.includes("/end")) {
                const body = init && init.body ? init.body : input instanceof Request ? input.clone().body : null;
                return new Response(await handleMuxxuRequest(requestUrl, body), { status: 200 });
            }
            return originalFetch(input, init);
        };

        XMLHttpRequest.prototype.open = function(method, url) {
            this._url = url;
            return originalOpen.apply(this, arguments);
        };

        XMLHttpRequest.prototype.send = function(body) {
            if (this._url && (this._url.includes("/start") || this._url.includes("/end"))) {
                handleMuxxuRequest(this._url, body).then((responseText) => {
                    Object.defineProperty(this, "status", { value: 200, writable: true });
                    Object.defineProperty(this, "responseText", { value: responseText, writable: true });
                    Object.defineProperty(this, "readyState", { value: 4, writable: true });
                    this.dispatchEvent(new Event("load"));
                    this.dispatchEvent(new Event("readystatechange"));
                });
                return;
            }
            return originalSend.apply(this, arguments);
        };
    }

    function createCell(text, className) {
        const cell = document.createElement("td");
        if (className) {
            cell.className = className;
        }
        cell.textContent = text;
        return cell;
    }

    function renderHistory() {
        const db = getDB();
        const body = byId("history-body");
        const empty = byId("history-empty");
        body.replaceChildren();

        if (!db.matches || db.matches.length === 0) {
            empty.style.display = "block";
            return;
        }

        empty.style.display = "none";
        db.matches.slice(0, 20).forEach((match) => {
            const row = document.createElement("tr");
            row.appendChild(createCell(String(match.date || "")));
            row.appendChild(createCell(Number(match.score || 0).toLocaleString(), "score-val"));

            const cardsCell = document.createElement("td");
            (match.cards || []).forEach((id) => {
                const tag = document.createElement("span");
                tag.className = "card-tag";
                tag.textContent = cardNames[id] || ("CARTA " + id);
                cardsCell.appendChild(tag);
            });
            row.appendChild(cardsCell);
            row.appendChild(createCell(String(match.fruits || 0)));
            row.appendChild(createCell(String(match.time || "")));
            body.appendChild(row);
        });
    }

    function buildArenaPayload() {
        const cards = [];
        for (let index = 0; index < cardNames.length; index += 1) {
            cards.push("oy5:_typejy9:_CardType:" + index + ":0y10:_availablety4:_numi99y4:mojozg");
        }
        return "oy6:_draftny6:_cardsa" + cards.join("") + "hy6:_playszy4:_agei25y10:_priceCardi50y10:_pricePacki460y12:_priceTicketi10g";
    }

    function serializeHaxeObject(obj) {
        let serialized = "o";
        Object.keys(obj).forEach((keyName) => {
            const value = obj[keyName];
            serialized += "y" + keyName.length + ":" + keyName;
            if (Array.isArray(value)) {
                serialized += "a" + value.map((entry) => entry === 0 ? "z" : "i" + entry).join("") + "h";
            } else if (value === 0) {
                serialized += "z";
            } else {
                serialized += "i" + value;
            }
        });
        return serialized + "g";
    }

    function loadRuffle(tab) {
        const host = byId("ruffle-host");
        host.replaceChildren();
        if (!window.RufflePlayer) {
            return;
        }

        const player = window.RufflePlayer.newest().createPlayer();
        host.appendChild(player);
        const db = getDB();
        const swf = tab === "arena" ? "snake/swf/es/game.swf" : "snake/swf/es/fruit.swf";
        const params = {
            data: key + (tab === "arena" ? buildArenaPayload() : serializeHaxeObject({ _list: db.fruits })),
            k: key,
            sid: "12345",
            lang: "es",
            dom: window.location.origin + window.location.pathname,
            time: Date.now().toString(),
        };

        if (tab === "arena") {
            params.mode = "browser";
        }

        player.load({
            url: swf,
            parameters: params,
            allowScriptAccess: true,
            scale: "showAll",
            quality: "high",
        }).catch((error) => {
            console.error("Ruffle no pudo cargar el SWF:", error);
        });
    }

    function switchTab(tab) {
        document.querySelectorAll(".menu-btn").forEach((button) => button.classList.remove("active"));
        const button = byId("btn-" + tab);
        if (button) {
            button.classList.add("active");
        }

        const host = byId("ruffle-host");
        const historyView = byId("history-view");
        const container = byId("game-container");
        if (tab === "history") {
            host.style.display = "none";
            historyView.style.display = "block";
            container.style.height = "630px";
            renderHistory();
            return;
        }

        host.style.display = "block";
        historyView.style.display = "none";
        container.style.height = tab === "arena" ? "630px" : "578px";
        loadRuffle(tab);
    }

    function updateUI() {
        const db = getDB();
        const discovered = db.fruits.filter((count, index) => index > 0 && count > 0).length;
        byId("fruit-count").textContent = discovered + " / 301";
    }

    function bindUI() {
        byId("btn-arena").addEventListener("click", () => switchTab("arena"));
        byId("btn-fruit").addEventListener("click", () => switchTab("fruit"));
        byId("btn-history").addEventListener("click", () => switchTab("history"));
        byId("btn-fullscreen").addEventListener("click", () => {
            byId("game-container").requestFullscreen().catch(() => {});
        });
        byId("btn-reset").addEventListener("click", () => {
            if (window.confirm("¿BORRAR DATOS?")) {
                localStorage.removeItem("snake_db");
                window.location.reload();
            }
        });
    }

    function waitForRuffle() {
        if (window.RufflePlayer) {
            switchTab("arena");
            return;
        }
        window.setTimeout(waitForRuffle, 100);
    }

    function init() {
        installNetworkInterceptors();
        bindUI();
        updateUI();
        waitForRuffle();
    }

    window.addEventListener("load", init, { once: true });
})();