$file = "dashboard.html"
$content = [System.IO.File]::ReadAllText($file)

# 3. SotibOlishView
$oldSotib = '<div className="flex justify-between items-center mb-6">
                            <h2 className="text-xl font-bold text-gray-900">Mahsulotlar bozori</h2>'
$newSotib = '<div className="flex flex-col sm:flex-row justify-between gap-4 items-center mb-6">
                            <h2 className="text-xl font-bold text-gray-900 w-full sm:w-auto">Mahsulotlar bozori</h2>
                            <div className="flex gap-2 w-full sm:w-auto">
                                <button className="flex-1 sm:flex-none bg-white border border-slate-200 text-slate-700 px-4 py-2 rounded-xl font-bold text-sm hover:bg-slate-50 transition-colors shadow-sm">Aqlli Filtrlar</button>
                                <button className="flex-1 sm:flex-none bg-forest-600 text-white px-4 py-2 rounded-xl font-bold text-sm hover:bg-forest-700 transition-colors shadow-sm">Tender E''lon Qilish ??</button>
                            </div>
                        </div>
                        <div className="hidden">'
$content = $content.Replace($oldSotib, $newSotib)

$trustScore = '<div className="text-xs font-bold text-yellow-500 mt-1 flex items-center gap-1">? 4.9/5 (Ishonchli sotuvchi)</div>'
$content = $content.Replace('<p className="text-sm font-medium text-gray-500">{item.seller}</p>', '<p className="text-sm font-medium text-gray-500">{item.seller}</p>' + "`n" + $trustScore)


# 4. ShartnomalarView
$oldShart = '<td className="px-6 py-4 text-sm whitespace-nowrap text-right">'
$newShart = '<td className="px-6 py-4 text-sm whitespace-nowrap text-right flex gap-2 justify-end">
                                                {row.status === "Kutilmoqda" && <button className="bg-forest-600 text-white text-[10px] font-bold px-2 py-1 rounded hover:bg-forest-700 transition-colors">E-Imzo ??</button>}
                                                {row.status === "Yakunlangan" && <button className="bg-slate-800 text-white text-[10px] font-bold px-2 py-1 rounded hover:bg-slate-900 transition-colors">Invoys PDF ??</button>}
                                                '
$content = $content.Replace($oldShart, $newShart)


# 6. TolovlarView
$oldTolov = '<h3 className="text-lg font-bold text-gray-900 mb-4">Oxirgi tranzaksiyalar</h3>'
$newTolov = '<div className="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
                            <div className="bg-white/80 backdrop-blur-xl rounded-2xl border border-slate-200/60 shadow-sm p-6 relative overflow-hidden hover:-translate-y-1 transition-transform">
                                <div className="absolute top-0 right-0 w-24 h-24 bg-emerald-100 rounded-full blur-2xl -mr-10 -mt-10"></div>
                                <h3 className="text-lg font-bold text-slate-800 mb-1">Xavfsiz To''lov (Escrow) ??</h3>
                                <p className="text-sm text-slate-500 mb-4">Yuk yetib borguncha pullar muzlatiladi</p>
                                <div className="text-3xl font-black text-slate-900 mb-2">$40,500.00</div>
                                <div className="text-xs font-bold text-emerald-600 bg-emerald-50 inline-block px-2 py-1 rounded-md border border-emerald-100">Kafolatlangan summa</div>
                            </div>
                            <div className="bg-white/80 backdrop-blur-xl rounded-2xl border border-slate-200/60 shadow-sm p-6 relative overflow-hidden hover:-translate-y-1 transition-transform">
                                <div className="absolute top-0 right-0 w-24 h-24 bg-blue-100 rounded-full blur-2xl -mr-10 -mt-10"></div>
                                <h3 className="text-lg font-bold text-slate-800 mb-1">Muddatli To''lov (Tranzsh) ??</h3>
                                <p className="text-sm text-slate-500 mb-4">Yirik xaridlar uchun bank kafolati</p>
                                <button className="w-full bg-slate-800 text-white font-bold py-2.5 rounded-xl hover:bg-slate-900 transition-colors shadow-sm mt-2">Kredit yoki Lizing so''rash</button>
                            </div>
                        </div>
                        <h3 className="text-lg font-bold text-gray-900 mb-4">Oxirgi tranzaksiyalar</h3>'
$content = $content.Replace($oldTolov, $newTolov)


[System.IO.File]::WriteAllText($file, $content)
