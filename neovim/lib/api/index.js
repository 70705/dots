"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.Tabpage = exports.Window = exports.Buffer = exports.NeovimClient = exports.Neovim = void 0;
var Neovim_1 = require("./Neovim");
Object.defineProperty(exports, "Neovim", { enumerable: true, get: function () { return Neovim_1.Neovim; } });
var client_1 = require("./client");
Object.defineProperty(exports, "NeovimClient", { enumerable: true, get: function () { return client_1.NeovimClient; } });
var Buffer_1 = require("./Buffer");
Object.defineProperty(exports, "Buffer", { enumerable: true, get: function () { return Buffer_1.Buffer; } });
var Window_1 = require("./Window");
Object.defineProperty(exports, "Window", { enumerable: true, get: function () { return Window_1.Window; } });
var Tabpage_1 = require("./Tabpage");
Object.defineProperty(exports, "Tabpage", { enumerable: true, get: function () { return Tabpage_1.Tabpage; } });
