$file = "dashboard.html"
$content = [System.IO.File]::ReadAllText($file)

# 2. MahsulotlarimView
$oldMah = '<div className="flex justify-between items-center text-sm">' + "`n" + '                                            <span className="text-gray-500 font-medium">Hujjat holati:</span>'
$newMah = '<div className="flex flex-wrap gap-2 pt-1 pb-1">
                                            <span className="bg-emerald-100 text-emerald-700 text-[10px] font-extrabold px-2 py-1 rounded-md border border-emerald-200">HALAL ???</span>
                                            <span className="bg-blue-100 text-blue-700 text-[10px] font-extrabold px-2 py-1 rounded-md border border-blue-200">GlobalGAP ??</span>
                                            <span className="bg-orange-100 text-orange-700 text-[10px] font-extrabold px-2 py-1 rounded-md border border-orange-200 cursor-pointer">3D Ko''rish ??</span>
                                        </div>
                                        <div className="flex justify-between items-center bg-forest-50 p-2 rounded-lg border border-forest-100 mb-2">
                                            <span className="text-[11px] font-bold text-forest-700">Tavsiya narx:</span>
                                            <span className="text-[11px] font-black text-forest-800">Optimal (Talab yuqori)</span>
                                        </div>
                                        ' + $oldMah

$content = $content.Replace($oldMah, $newMah)

# 3. SotibOlishView
$oldSotib = '<div className="flex justify-between items-center mb-6">' + "`n" + '                            <h2 className="text-xl font-bold text-gray-900">Mahsulotlar bozori</h2>'
$newSotib = '<div className="flex flex-col sm:flex-row justify-between gap-4 items-center mb-6">
                            <h2 className="text-xl font-bold text-gray-900 w-full sm:w-auto">Mahsulotlar bozori</h2>
                            <div className="flex gap-2 w-full sm:w-auto">
                                <button className="flex-1 sm:flex-none bg-white border border-slate-200 text-slate-700 px-4 py-2 rounded-xl font-bold text-sm hover:bg-slate-50 transition-colors shadow-sm">Aqlli Filtrlar</button>
                                <button className="flex-1 sm:flex-none bg-forest-600 text-white px-4 py-2 rounded-xl font-bold text-sm hover:bg-forest-700 transition-colors shadow-sm">Tender E''lon Qilish ??</button>
                            </div>
                        </div>
                        <div className="hidden">'

$content = $content.Replace($oldSotib, $newSotib)

# 4. ShartnomalarView
$oldShart = '<td className="px-6 py-4 text-sm whitespace-nowrap text-right">'
$newShart = '<td className="px-6 py-4 text-sm whitespace-nowrap text-right flex gap-2 justify-end">
                                                {row.status === "Kutilmoqda" && <button className="bg-forest-600 text-white text-[10px] font-bold px-2 py-1 rounded hover:bg-forest-700 transition-colors">E-Imzo ??</button>}
                                                {row.status === "Yakunlangan" && <button className="bg-slate-800 text-white text-[10px] font-bold px-2 py-1 rounded hover:bg-slate-900 transition-colors">Invoys PDF ??</button>}
                                                '
$content = $content.Replace($oldShart, $newShart)

# 5. LogistikaView
$oldLogi = '<div className="flex flex-col lg:flex-row gap-6 h-full">'
$newLogi = '<div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                                <div className="bg-gradient-to-r from-blue-600 to-blue-800 rounded-2xl p-6 text-white shadow-lg relative overflow-hidden">
                                    <div className="absolute -right-10 -top-10 w-40 h-40 bg-white/10 rounded-full blur-2xl"></div>
                                    <h3 className="font-bold text-lg mb-2">Marshrut Kalkulyatori ???</h3>
                                    <p className="text-blue-100 text-sm mb-4">Eng arzon va tezkor yo''lni avtomatik hisoblang.</p>
                                    <button className="bg-white text-blue-800 text-sm font-bold px-4 py-2 rounded-xl hover:bg-blue-50 transition-colors shadow-sm">Hisoblash</button>
                                </div>
                                <div className="bg-gradient-to-r from-orange-500 to-orange-600 rounded-2xl p-6 text-white shadow-lg relative overflow-hidden">
                                    <div className="absolute -right-10 -bottom-10 w-40 h-40 bg-white/10 rounded-full blur-2xl"></div>
                                    <h3 className="font-bold text-lg mb-2">Yuklarni Birlashtirish ??</h3>
                                    <p className="text-orange-100 text-sm mb-4">Kichik yuklarni bir furaga jamlab pulingizni tejang.</p>
                                    <button className="bg-white text-orange-600 text-sm font-bold px-4 py-2 rounded-xl hover:bg-orange-50 transition-colors shadow-sm">Sherik qidirish</button>
                                </div>
                            </div>
                            <div className="flex flex-col lg:flex-row gap-6 h-full">'
$content = $content.Replace($oldLogi, $newLogi)

# 6. TolovlarView
$oldTolov = '<h3 className="text-lg font-bold text-gray-900 mb-4">Oxirgi tranzaksiyalar</h3>'
$newTolov = '<div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
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
$content = $content.Replace($oldTolov, $newTolov)

# 7. GlobalChatWidget
$chatWidget = @"
            const GlobalChatWidget = () => {
                const [isOpen, setIsOpen] = useState(false);
                const [mode, setMode] = useState('tarjimon'); // 'tarjimon' or 'bojxona'
                return (
                    <div className="fixed bottom-6 right-6 z-[200]">
                        {!isOpen ? (
                            <button onClick={() => setIsOpen(true)} className="w-14 h-14 bg-forest-600 text-white rounded-full flex items-center justify-center shadow-2xl hover:bg-forest-700 hover:scale-105 transition-all animate-bounce">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path></svg>
                            </button>
                        ) : (
                            <div className="w-80 sm:w-96 bg-white rounded-3xl shadow-2xl border border-slate-100 overflow-hidden flex flex-col h-[500px] animate-fade-in">
                                <div className="bg-gradient-to-r from-forest-700 to-forest-900 p-4 text-white flex justify-between items-center shadow-md z-10 relative">
                                    <div className="flex flex-col">
                                        <span className="font-bold">ExportTech Aloqa ??</span>
                                        <span className="text-xs text-forest-200">{mode === 'tarjimon' ? 'Avtomat tarjimon yoqilgan' : 'Bojxona AI Boti'}</span>
                                    </div>
                                    <button onClick={() => setIsOpen(false)} className="text-forest-100 hover:text-white p-1 bg-white/10 rounded-full"><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></button>
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

$oldApp = 'const App = () => {'
$newApp = $chatWidget + "`n        " + $oldApp
$content = $content.Replace($oldApp, $newApp)

$content = $content.Replace('<NotificationsModal />', "<NotificationsModal />`n                    <GlobalChatWidget />")

[System.IO.File]::WriteAllText($file, $content)
