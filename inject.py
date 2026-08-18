import re

with open('dashboard.html', 'r', encoding='utf-8') as f:
    html = f.read()

# 1. AsosiyView: Add AI widgets
asosiy_widgets = '''
                        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-8">
                            <div className="bg-gradient-to-br from-emerald-500 to-forest-700 p-6 rounded-2xl shadow-lg text-white relative overflow-hidden">
                                <div className="absolute top-0 right-0 w-32 h-32 bg-white/10 rounded-full blur-2xl"></div>
                                <h3 className="text-lg font-bold mb-1">AI Bashorat ??</h3>
                                <p className="text-emerald-100 text-sm mb-4">Sun'iy intellekt xulosasi</p>
                                <div className="space-y-3">
                                    <div className="flex justify-between items-center bg-black/20 p-3 rounded-xl">
                                        <span className="font-medium text-sm">Gilos (BAA)</span>
                                        <span className="text-emerald-300 font-bold text-sm">+15% talab ^</span>
                                    </div>
                                    <div className="flex justify-between items-center bg-black/20 p-3 rounded-xl">
                                        <span className="font-medium text-sm">Qovun (Germaniya)</span>
                                        <span className="text-emerald-300 font-bold text-sm">+8% narx ^</span>
                                    </div>
                                </div>
                            </div>
                            <div className="bg-white/80 backdrop-blur-xl p-6 rounded-2xl border border-slate-200/60 shadow-sm">
                                <h3 className="text-lg font-bold text-slate-800 mb-1">Global Kurslar</h3>
                                <p className="text-slate-500 text-sm mb-4">Bojxona to'lovlari indeksi</p>
                                <div className="space-y-3">
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
                            <div className="bg-white/80 backdrop-blur-xl p-6 rounded-2xl border border-slate-200/60 shadow-sm flex flex-col justify-center items-center text-center">
                                <h3 className="text-lg font-bold text-slate-800 mb-2">Profil Muvaffaqiyati</h3>
                                <div className="w-24 h-24 rounded-full border-4 border-slate-100 flex items-center justify-center relative mb-3">
                                    <svg className="absolute inset-0 w-full h-full transform -rotate-90" viewBox="0 0 100 100">
                                        <circle cx="50" cy="50" r="46" fill="transparent" stroke="#10b981" strokeWidth="8" strokeDasharray="289" strokeDashoffset="43" className="transition-all duration-1000"></circle>
                                    </svg>
                                    <span className="text-2xl font-black text-slate-800">85%</span>
                                </div>
                                <p className="text-xs text-slate-500 font-medium">Sertifikatlarni yuklang va 100% ga erishing.</p>
                            </div>
                        </div>
'''
html = html.replace('<div className="grid grid-cols-1 lg:grid-cols-3 gap-6">', asosiy_widgets + '\n                        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">')


# 2. MahsulotlarimView: Add Badges, 3D, Optimal Price
mahsulot_badges = '''
                                            <div className="flex flex-wrap gap-2 mt-3">
                                                {item.cert === 'halal' && <span className="bg-emerald-100 text-emerald-700 text-[10px] font-bold px-2 py-1 rounded-md border border-emerald-200">HALAL ???</span>}
                                                {item.cert === 'globalgap' && <span className="bg-blue-100 text-blue-700 text-[10px] font-bold px-2 py-1 rounded-md border border-blue-200">GlobalGAP ??</span>}
                                                <span className="bg-orange-100 text-orange-700 text-[10px] font-bold px-2 py-1 rounded-md border border-orange-200">3D Ko'rish ??</span>
                                            </div>
                                            <div className="mt-3 pt-3 border-t border-slate-100 flex justify-between items-center">
                                                <span className="text-xs font-medium text-slate-500">Bozor narxi:</span>
                                                <span className="text-xs font-bold text-emerald-600">Optimal (Talab yuqori)</span>
                                            </div>
'''
html = html.replace('<div className="font-bold text-gray-900 mt-1">{item.qty}</div>', '<div className="font-bold text-gray-900 mt-1">{item.qty}</div>' + mahsulot_badges)


# 3. SotibOlishView: Add Tender, Trust Score, Smart Filters
sotib_top = '''
                        <div className="flex flex-col sm:flex-row justify-between gap-4 items-center mb-6">
                            <div className="relative w-full sm:w-96">
                                <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none text-gray-400"><Icons.Search size={18} /></div>
                                <input type="text" placeholder="Mahsulot yoki fermerni qidirish..." className="w-full pl-10 pr-4 py-2.5 bg-white border border-slate-200 rounded-xl text-sm focus:outline-none focus:border-forest-500 focus:ring-1 focus:ring-forest-500 transition-shadow shadow-sm" />
                            </div>
                            <div className="flex gap-2 w-full sm:w-auto">
                                <button className="flex-1 sm:flex-none flex items-center justify-center gap-2 bg-white border border-slate-200 text-slate-700 px-4 py-2.5 rounded-xl font-bold text-sm hover:bg-slate-50 transition-colors shadow-sm">
                                    <Icons.Filter size={16} /> Aqlli Filtrlar
                                </button>
                                <button className="flex-1 sm:flex-none flex items-center justify-center gap-2 bg-forest-600 text-white px-4 py-2.5 rounded-xl font-bold text-sm hover:bg-forest-700 transition-colors shadow-sm">
                                    Tender E'lon Qilish ??
                                </button>
                            </div>
                        </div>
'''
html = re.sub(r'<div className="flex justify-between items-center mb-6">.*?</div>', sotib_top, html, count=1, flags=re.DOTALL)

trust_score = '''<div className="text-xs font-bold text-yellow-500 mt-1 flex items-center gap-1">? 4.9/5 (Ishonchli sotuvchi)</div>'''
html = html.replace('<p className="text-sm font-medium text-gray-500">{item.seller}</p>', '<p className="text-sm font-medium text-gray-500">{item.seller}</p>' + trust_score)


# 4. ShartnomalarView: Add E-Sign, Auto Invoice
shartnoma_buttons = '''
                                                    <div className="flex items-center justify-between mt-4 pt-4 border-t border-slate-100">
                                                        <span className={px-2.5 py-1 rounded-md text-xs font-bold border }>{row.status}</span>
                                                        <div className="flex gap-2">
                                                            {row.status === 'Kutilmoqda' && <button className="bg-forest-600 text-white text-xs font-bold px-3 py-1.5 rounded-lg hover:bg-forest-700 transition-colors shadow-sm flex items-center gap-1">E-Imzo ??</button>}
                                                            {row.status === 'Yakunlangan' && <button className="bg-slate-800 text-white text-xs font-bold px-3 py-1.5 rounded-lg hover:bg-slate-900 transition-colors shadow-sm flex items-center gap-1">Invoys PDF ??</button>}
                                                        </div>
                                                    </div>
'''
html = re.sub(r'<span className={px-2\.5 py-1 rounded-md text-xs font-bold border \}>{row\.status}</span>', shartnoma_buttons, html)


# 5. LogistikaView: Add Route Calc & Load Merge
logistika_widgets = '''
                            <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                                <div className="bg-gradient-to-r from-blue-600 to-blue-800 rounded-2xl p-6 text-white shadow-lg relative overflow-hidden">
                                    <div className="absolute -right-10 -top-10 w-40 h-40 bg-white/10 rounded-full blur-2xl"></div>
                                    <h3 className="font-bold text-lg mb-2">Marshrut Kalkulyatori ???</h3>
                                    <p className="text-blue-100 text-sm mb-4">Eng arzon va tezkor yo'lni avtomatik hisoblang.</p>
                                    <button className="bg-white text-blue-800 text-sm font-bold px-4 py-2 rounded-xl hover:bg-blue-50 transition-colors shadow-sm">Hisoblashni boshlash</button>
                                </div>
                                <div className="bg-gradient-to-r from-orange-500 to-orange-600 rounded-2xl p-6 text-white shadow-lg relative overflow-hidden">
                                    <div className="absolute -right-10 -bottom-10 w-40 h-40 bg-white/10 rounded-full blur-2xl"></div>
                                    <h3 className="font-bold text-lg mb-2">Yuklarni Birlashtirish (Сборный) ??</h3>
                                    <p className="text-orange-100 text-sm mb-4">Kichik yuklarni bir furaga jamlab pulingizni tejang.</p>
                                    <button className="bg-white text-orange-600 text-sm font-bold px-4 py-2 rounded-xl hover:bg-orange-50 transition-colors shadow-sm">Sherik qidirish</button>
                                </div>
                            </div>
'''
html = html.replace('<div className="flex justify-between items-center mb-6">', logistika_widgets + '\n                        <div className="flex justify-between items-center mb-6">')


# 6. TolovlarView: Add Escrow block, Installments
tolov_widgets = '''
                        <div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
                            <div className="bg-white/80 backdrop-blur-xl rounded-2xl border border-slate-200/60 shadow-sm p-6 relative overflow-hidden">
                                <div className="absolute top-0 right-0 w-24 h-24 bg-emerald-100 rounded-full blur-2xl -mr-10 -mt-10"></div>
                                <h3 className="text-lg font-bold text-slate-800 mb-1">Xavfsiz To'lov (Escrow) ??</h3>
                                <p className="text-sm text-slate-500 mb-4">Yuk yetib borguncha pullar muzlatiladi</p>
                                <div className="text-3xl font-black text-slate-900 mb-2">,500.00</div>
                                <div className="text-xs font-bold text-emerald-600 bg-emerald-50 inline-block px-2 py-1 rounded-md border border-emerald-100">Kafolatlangan summa</div>
                            </div>
                            <div className="bg-white/80 backdrop-blur-xl rounded-2xl border border-slate-200/60 shadow-sm p-6 relative overflow-hidden">
                                <div className="absolute top-0 right-0 w-24 h-24 bg-blue-100 rounded-full blur-2xl -mr-10 -mt-10"></div>
                                <h3 className="text-lg font-bold text-slate-800 mb-1">Muddatli To'lov (Tranzsh) ??</h3>
                                <p className="text-sm text-slate-500 mb-4">Yirik xaridlar uchun bank kafolati</p>
                                <button className="w-full bg-slate-800 text-white font-bold py-2.5 rounded-xl hover:bg-slate-900 transition-colors shadow-sm mt-2">Kredit yoki Lizing so'rash</button>
                            </div>
                        </div>
'''
html = html.replace('<h3 className="text-lg font-bold text-gray-900 mb-4">Oxirgi tranzaksiyalar</h3>', tolov_widgets + '\n                        <h3 className="text-lg font-bold text-gray-900 mb-4">Oxirgi tranzaksiyalar</h3>')


# 7. Add Floating Global Chat (Avtomat tarjimon + Bojxona Boti)
chat_widget = '''
            const GlobalChatWidget = () => {
                const [isOpen, setIsOpen] = useState(false);
                const [mode, setMode] = useState('tarjimon'); // 'tarjimon' or 'bojxona'
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
                                    <button onClick={() => setMode('tarjimon')} className={lex-1 text-xs font-bold py-1.5 rounded-lg transition-colors }>Xaridor bilan (Tarjima)</button>
                                    <button onClick={() => setMode('bojxona')} className={lex-1 text-xs font-bold py-1.5 rounded-lg transition-colors }>Bojxona Boti ??</button>
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
                                                    <p className="text-[10px] text-forest-200 mt-1 font-bold">Перевод: Здравствуйте, есть. О цене договоримся.</p>
                                                </div>
                                            </div>
                                        </>
                                    ) : (
                                        <>
                                            <div className="flex gap-2">
                                                <div className="w-8 h-8 rounded-full bg-emerald-100 flex items-center justify-center text-xs font-bold text-emerald-700">??</div>
                                                <div className="bg-white p-3 rounded-2xl rounded-tl-none shadow-sm border border-slate-100 max-w-[80%]">
                                                    <p className="text-sm text-slate-800">Salom! Men ExportTech bojxona botiman. Qaysi davlatga eksport qilmoqchisiz va bojxona to'lovlari haqida ma'lumot kerakmi?</p>
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
'''
html = html.replace('const App = () => {', chat_widget + '\n        const App = () => {')
html = html.replace('<NotificationsModal />', '<NotificationsModal />\n                    <GlobalChatWidget />')


with open('dashboard.html', 'w', encoding='utf-8') as f:
    f.write(html)
