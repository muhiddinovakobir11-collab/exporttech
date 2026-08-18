$file = "dashboard.html"
$content = [System.IO.File]::ReadAllText($file)

# 1. AsosiyView
$content = $content -replace '(?s)<div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-4 sm:gap-6 mb-8">', '<div className="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-8">
                            <div className="bg-gradient-to-br from-emerald-500 to-forest-700 p-6 rounded-2xl shadow-lg text-white relative overflow-hidden hover:scale-[1.02] transition-transform">
                                <div className="absolute top-0 right-0 w-32 h-32 bg-white/10 rounded-full blur-2xl"></div>
                                <h3 className="text-lg font-bold mb-1">AI Bashorat ??</h3>
                                <p className="text-emerald-100 text-sm mb-4">Sun''iy intellekt xulosasi</p>
                                <div className="space-y-3 relative z-10">
                                    <div className="flex justify-between items-center bg-black/20 p-3 rounded-xl border border-white/10">
                                        <span className="font-medium text-sm">Gilos (BAA)</span>
                                        <span className="text-emerald-300 font-bold text-sm">+15% talab ^</span>
                                    </div>
                                    <div className="flex justify-between items-center bg-black/20 p-3 rounded-xl border border-white/10">
                                        <span className="font-medium text-sm">Qovun (Germaniya)</span>
                                        <span className="text-emerald-300 font-bold text-sm">+8% narx ^</span>
                                    </div>
                                </div>
                            </div>
                            <div className="bg-white/80 backdrop-blur-xl p-6 rounded-2xl border border-slate-200/60 shadow-[0_4px_20px_-4px_rgba(0,0,0,0.03)] relative overflow-hidden">
                                <h3 className="text-lg font-bold text-slate-800 mb-1">Global Kurslar ??</h3>
                                <p className="text-slate-500 text-sm mb-4">Jonli bojxona to''lovlari indeksi</p>
                                <div className="space-y-3 relative z-10">
                                    <div className="flex justify-between items-center border-b border-slate-100 pb-2">
                                        <span className="font-bold text-slate-700">1 USD</span>
                                        <span className="text-slate-900 font-black">12,650 UZS</span>
                                    </div>
                                    <div className="flex justify-between items-center border-b border-slate-100 pb-2">
                                        <span className="font-bold text-slate-700">1 EUR</span>
                                        <span className="text-slate-900 font-black">13,800 UZS</span>
                                    </div>
                                    <div className="flex justify-between items-center pt-1">
                                        <span className="font-medium text-xs text-slate-500">Eksport boji indeksi</span>
                                        <span className="text-emerald-600 font-bold text-xs">Qulay (-2%)</span>
                                    </div>
                                </div>
                            </div>
                            <div className="bg-white/80 backdrop-blur-xl p-6 rounded-2xl border border-slate-200/60 shadow-[0_4px_20px_-4px_rgba(0,0,0,0.03)] flex flex-col justify-center items-center text-center">
                                <h3 className="text-lg font-bold text-slate-800 mb-2">Profil Muvaffaqiyati ??</h3>
                                <div className="w-24 h-24 rounded-full border-4 border-slate-100 flex items-center justify-center relative mb-3">
                                    <svg className="absolute inset-0 w-full h-full transform -rotate-90" viewBox="0 0 100 100">
                                        <circle cx="50" cy="50" r="46" fill="transparent" stroke="#10b981" strokeWidth="8" strokeDasharray="289" strokeDashoffset="43" className="transition-all duration-1000"></circle>
                                    </svg>
                                    <span className="text-2xl font-black text-slate-800">85%</span>
                                </div>
                                <p className="text-xs text-slate-500 font-medium">Sertifikatlarni yuklang va 100% ga erishing.</p>
                            </div>
                        </div>
                        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-4 sm:gap-6 mb-8">'

# 2. MahsulotlarimView
$content = $content -replace '(?s)<div className="flex justify-between items-center text-sm">\s*<span className="text-gray-500 font-medium">Hujjat holati:</span>', '<div className="flex flex-wrap gap-2 pt-1 pb-1">
                                            <span className="bg-emerald-100 text-emerald-700 text-[10px] font-extrabold px-2 py-1 rounded-md border border-emerald-200">HALAL ???</span>
                                            <span className="bg-blue-100 text-blue-700 text-[10px] font-extrabold px-2 py-1 rounded-md border border-blue-200">GlobalGAP ??</span>
                                            <span className="bg-orange-100 text-orange-700 text-[10px] font-extrabold px-2 py-1 rounded-md border border-orange-200 cursor-pointer">3D Ko''rish ??</span>
                                        </div>
                                        <div className="flex justify-between items-center bg-forest-50 p-2 rounded-lg border border-forest-100 mb-2">
                                            <span className="text-[11px] font-bold text-forest-700">Tavsiya narx:</span>
                                            <span className="text-[11px] font-black text-forest-800">Optimal (Talab yuqori)</span>
                                        </div>
                                        <div className="flex justify-between items-center text-sm">
                                            <span className="text-gray-500 font-medium">Hujjat holati:</span>'

# 3. SotibOlishView (Xaridlar)
$content = $content -replace '(?s)<div className="flex items-center gap-2 bg-white px-4 py-2.5 rounded-xl border border-gray-200 shadow-sm">\s*<Icons.Search />\s*<input type="text" placeholder="Mahsulot qidirish..." className="border-none outline-none text-sm text-gray-700 w-full" />\s*</div>', '<div className="flex gap-2 w-full sm:w-auto">
                                <button className="flex-1 sm:flex-none bg-white border border-slate-200 text-slate-700 px-4 py-2.5 rounded-xl font-bold text-sm hover:bg-slate-50 transition-colors shadow-sm flex items-center gap-2"><Icons.Filter size={18} /> Aqlli Filtrlar</button>
                                <button className="flex-1 sm:flex-none bg-forest-600 text-white px-4 py-2.5 rounded-xl font-bold text-sm hover:bg-forest-700 transition-colors shadow-sm flex items-center gap-2"><Icons.Plus size={18} /> Tender E''lon Qilish</button>
                            </div>'

# 3b. Trust score
$content = $content -replace '(?s)<p className="text-sm font-medium text-gray-500">([^<]+)</p>\s*</div>\s*</div>\s*<div className="flex items-baseline gap-1 mb-4">', '<p className="text-sm font-medium text-gray-500">$1</p><div className="text-[10px] font-bold text-yellow-500 mt-1 flex items-center gap-1">? 4.9/5 (Ishonchli sotuvchi)</div></div></div><div className="flex items-baseline gap-1 mb-4">'

# 4. ShartnomalarView
$content = $content -replace '(?s)<span className={`px-2\.5 py-1 rounded-md text-xs font-bold border \$\{s\[status\]\}`}>{status}</span>;', '<div className="flex gap-2 items-center justify-end"><span className={`px-2.5 py-1 rounded-md text-xs font-bold border ${s[status]}`}>{status}</span>{status === "Kutilmoqda" && <button className="bg-forest-600 text-white text-[10px] font-bold px-2 py-1.5 rounded-lg hover:bg-forest-700 transition-colors shadow-sm">E-Imzo ??</button>}{status === "Yakunlangan" && <button className="bg-slate-800 text-white text-[10px] font-bold px-2 py-1.5 rounded-lg hover:bg-slate-900 transition-colors shadow-sm">Invoys PDF ??</button>}</div>;'

# 5. LogistikaView
$content = $content -replace '(?s)<div className="flex flex-col lg:flex-row gap-6 h-\[800px\] lg:h-\[700px\]">', '<div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                        <div className="bg-gradient-to-r from-blue-600 to-blue-800 rounded-2xl p-6 text-white shadow-lg relative overflow-hidden">
                            <div className="absolute -right-10 -top-10 w-40 h-40 bg-white/10 rounded-full blur-2xl"></div>
                            <h3 className="font-bold text-lg mb-2">Marshrut Kalkulyatori ???</h3>
                            <p className="text-blue-100 text-sm mb-4">Eng arzon va tezkor yo''lni avtomatik hisoblang.</p>
                            <button onClick={() => setCalcOpen(true)} className="bg-white text-blue-800 text-sm font-bold px-4 py-2 rounded-xl hover:bg-blue-50 transition-colors shadow-sm">Hisoblash</button>
                        </div>
                        <div className="bg-gradient-to-r from-orange-500 to-orange-600 rounded-2xl p-6 text-white shadow-lg relative overflow-hidden">
                            <div className="absolute -right-10 -bottom-10 w-40 h-40 bg-white/10 rounded-full blur-2xl"></div>
                            <h3 className="font-bold text-lg mb-2">Yuklarni Birlashtirish (Сборный) ??</h3>
                            <p className="text-orange-100 text-sm mb-4">Kichik yuklarni bir furaga jamlab pulingizni tejang.</p>
                            <button className="bg-white text-orange-600 text-sm font-bold px-4 py-2 rounded-xl hover:bg-orange-50 transition-colors shadow-sm cursor-pointer">Sherik qidirish</button>
                        </div>
                    </div>
                    <div className="flex flex-col lg:flex-row gap-6 h-[800px] lg:h-[700px]">'

# 6. TolovlarView
$content = $content -replace '(?s)<h3 className="text-lg font-bold text-gray-900 mb-4">Oxirgi tranzaksiyalar</h3>', '<div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
                            <div className="bg-white/80 backdrop-blur-xl rounded-2xl border border-slate-200/60 shadow-sm p-6 relative overflow-hidden">
                                <div className="absolute top-0 right-0 w-24 h-24 bg-emerald-100 rounded-full blur-2xl -mr-10 -mt-10"></div>
                                <h3 className="text-lg font-bold text-slate-800 mb-1">Xavfsiz To''lov (Escrow) ??</h3>
                                <p className="text-sm text-slate-500 mb-4">Yuk yetib borguncha pullar muzlatiladi</p>
                                <div className="text-3xl font-black text-slate-900 mb-2">$40,500.00</div>
                                <div className="text-xs font-bold text-emerald-600 bg-emerald-50 inline-block px-2 py-1 rounded-md border border-emerald-100">Kafolatlangan summa</div>
                            </div>
                            <div className="bg-white/80 backdrop-blur-xl rounded-2xl border border-slate-200/60 shadow-sm p-6 relative overflow-hidden">
                                <div className="absolute top-0 right-0 w-24 h-24 bg-blue-100 rounded-full blur-2xl -mr-10 -mt-10"></div>
                                <h3 className="text-lg font-bold text-slate-800 mb-1">Muddatli To''lov (Tranzsh) ??</h3>
                                <p className="text-sm text-slate-500 mb-4">Yirik xaridlar uchun bank kafolati</p>
                                <button className="w-full bg-slate-800 text-white font-bold py-2.5 rounded-xl hover:bg-slate-900 transition-colors shadow-sm mt-2">Kredit yoki Lizing so''rash</button>
                            </div>
                        </div>
                        <h3 className="text-lg font-bold text-gray-900 mb-4">Oxirgi tranzaksiyalar</h3>'

# 7. GlobalChatWidget
$chatWidget = @"
            const GlobalChatWidget = () => {
                const [isOpen, setIsOpen] = useState(false);
                const [mode, setMode] = useState('tarjimon');
                return (
                    <div className="fixed bottom-6 right-6 z-[200]">
                        {!isOpen ? (
                            <button onClick={() => setIsOpen(true)} className="w-14 h-14 bg-forest-600 text-white rounded-full flex items-center justify-center shadow-2xl hover:bg-forest-700 hover:scale-105 transition-all animate-bounce">
                                <MessageSVG />
                            </button>
                        ) : (
                            <div className="w-80 sm:w-96 bg-white rounded-3xl shadow-2xl border border-slate-100 overflow-hidden flex flex-col h-[500px] animate-fade-in">
                                <div className="bg-gradient-to-r from-forest-700 to-forest-900 p-4 text-white flex justify-between items-center shadow-md z-10 relative">
                                    <div className="flex flex-col">
                                        <span className="font-bold">ExportTech Aloqa ??</span>
                                        <span className="text-xs text-forest-200">{mode === 'tarjimon' ? 'Avtomat tarjimon yoqilgan' : 'Bojxona AI Boti'}</span>
                                    </div>
                                    <button onClick={() => setIsOpen(false)} className="text-forest-100 hover:text-white p-1 bg-white/10 rounded-full"><Icons.X size={18} /></button>
                                </div>
                                <div className="flex bg-slate-50 p-2 gap-2 border-b border-slate-100 shadow-sm z-10 relative">
                                    <button onClick={() => setMode('tarjimon')} className={`flex-1 text-xs font-bold py-1.5 rounded-lg transition-colors ${mode === 'tarjimon' ? 'bg-white text-forest-700 shadow-sm border border-slate-200' : 'text-slate-500 hover:bg-slate-200'}`}>Xaridor bilan</button>
                                    <button onClick={() => setMode('bojxona')} className={`flex-1 text-xs font-bold py-1.5 rounded-lg transition-colors ${mode === 'bojxona' ? 'bg-white text-forest-700 shadow-sm border border-slate-200' : 'text-slate-500 hover:bg-slate-200'}`}>Bojxona Boti ??</button>
                                </div>
                                <div className="flex-1 p-4 overflow-y-auto bg-slate-50 space-y-4">
                                    {mode === 'tarjimon' ? (
                                        <>
                                            <div className="flex gap-2">
                                                <div className="w-8 h-8 rounded-full bg-blue-100 flex items-center justify-center text-xs font-bold text-blue-700">X</div>
                                                <div className="bg-white p-3 rounded-2xl rounded-tl-none shadow-sm border border-slate-100 max-w-[80%]">
                                                    <p className="text-sm text-slate-800">Здравствуйте, мне нужны 20 тонн помидоров.</p>
                                                    <p className="text-[10px] text-forest-600 mt-1 font-bold">Tarjima: Salom, menga 20 tonna pomidor kerak.</p>
                                                </div>
                                            </div>
                                            <div className="flex gap-2 flex-row-reverse">
                                                <div className="w-8 h-8 rounded-full bg-forest-100 flex items-center justify-center text-xs font-bold text-forest-700">Siz</div>
                                                <div className="bg-forest-600 text-white p-3 rounded-2xl rounded-tr-none shadow-sm max-w-[80%]">
                                                    <p className="text-sm">Assalomu alaykum, bor. Narxini kelishamiz.</p>
                                                    <p className="text-[10px] text-forest-200 mt-1 font-bold">Перевод: Здравствуйте, есть.</p>
                                                </div>
                                            </div>
                                        </>
                                    ) : (
                                        <>
                                            <div className="flex gap-2">
                                                <div className="w-8 h-8 rounded-full bg-emerald-100 flex items-center justify-center text-xs font-bold text-emerald-700">??</div>
                                                <div className="bg-white p-3 rounded-2xl rounded-tl-none shadow-sm border border-slate-100 max-w-[80%]">
                                                    <p className="text-sm text-slate-800">Salom! Men ExportTech bojxona botiman. Qaysi davlatga eksport qilmoqchisiz?</p>
                                                </div>
                                            </div>
                                        </>
                                    )}
                                </div>
                                <div className="p-3 bg-white border-t border-slate-100 flex gap-2">
                                    <input type="text" placeholder="Xabar yozish..." className="flex-1 bg-slate-50 border border-slate-200 rounded-xl px-3 py-2 text-sm focus:outline-none focus:border-forest-500" />
                                    <button className="bg-forest-600 text-white w-10 h-10 rounded-xl flex items-center justify-center hover:bg-forest-700 transition-colors shadow-sm">?</button>
                                </div>
                            </div>
                        )}
                    </div>
                );
            };
"@

$content = $content -replace '(?s)const App = \(\) => \{', ($chatWidget + "`n        const App = () => {")
$content = $content -replace '(?s)<NotificationsModal />', "<NotificationsModal />`n                    <GlobalChatWidget />"

[System.IO.File]::WriteAllText($file, $content)
