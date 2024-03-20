

// select box 요소들
const selectBoxes = document.querySelectorAll(".search-area select")

for (let i of selectBoxes) {
    
    i.addEventListener("change" , e=>{

        const major = document.getElementsByName("major")[0];
        const grade = document.getElementsByName("grade")[0];
        const step = document.getElementsByName("step")[0];
        const type = document.getElementsByName("type")[0];
        

        const majorIndex = major.selectedIndex;
        const majorValue = major.options[majorIndex].value;

        const gradeIndex = grade.selectedIndex;
        const gradeValue = grade.options[gradeIndex].value;

        const stepIndex = step.selectedIndex;
        const stepValue = step.options[stepIndex].value;

        const typeIndex = type.selectedIndex;
        const typeValue = type.options[typeIndex].value;

        const keys = {
            'major' : majorValue,
            'grade' : gradeValue,
            'step'  : stepValue,
            'type'  : typeValue,
        }

        fetch('/collegian/selectClassList' , {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(keys)
        })
        .then(res => res.json())
        .then(searchList => {
            
            history.replaceState({}, null, location.pathname);
            
            document.getElementsByName("query")[0].value = '';

            placeholer();

            const pagination = searchList.pagination;

            const classList = searchList.classList;

            const area = document.getElementById("ajax-area");

            area.innerHTML = "";

            const firstTr = document.createElement("tr");

            const a = document.createElement("th");
            a.innerText = "No.";
            const b = document.createElement("th");
            b.innerText = "학과명";
            const c = document.createElement("th");
            c.innerText = "학년";
            const d = document.createElement("th");
            d.innerText = "학기";
            const e = document.createElement("th");
            e.innerText = "과목명";
            const f = document.createElement("th");
            f.innerText = "분류";
            const g = document.createElement("th");
            g.innerText = "학점";
            const h = document.createElement("th");
            h.innerText = "담당교수";

            firstTr.append(a,b,c,d,e,f,g,h);

            area.append(firstTr);

            if(classList.length == 0) {

                const nullTr = document.createElement("tr");

                const nullTd = document.createElement("td");

                nullTd.innerText = "과목이 존재하지 않습니다.";

                nullTd.style.textAlign ="center";
                nullTd.style.fontSize = "17px";

                nullTd.setAttribute("colspan", '8');

                nullTr.append(nullTd);

                area.append(nullTr);
            }
            
            for (const i of classList) {

                const tr = document.createElement("tr");

                let classTypeText = "";

                if(i.classPoint == 3) {
                    classTypeText = '전공';
                }else{
                    classTypeText = '교양';
                }

                const classTd = document.createElement("td");
                classTd.innerText = i.classNo;
                const departmentName = document.createElement("td");
                departmentName.innerText = i.departmentName;
                const classGrade = document.createElement("td");
                classGrade.innerText = i.classGrade+"학년";
                const classTrem = document.createElement("td");
                classTrem.innerText = i.classTrem+"학기";
                const className = document.createElement("td");
                className.innerText = i.className;
                const classPoint = document.createElement("td");
                classPoint.innerText = i.classPoint;
                const classType = document.createElement("td");
                classType.innerText = classTypeText;
                const memberName = document.createElement("td");
                memberName.innerText = i.memberName;

                tr.append(classTd,departmentName,classGrade, classTrem, className, classPoint , classType , memberName);
                
                area.append(tr);
            }

        } )
        .catch(err => {console.log(err)})
    })
}

const placeholer = () => {
    const urlParams = new URL(location.href).searchParams;

    const major = urlParams.get('major');
    const grade = urlParams.get('grade');
    const step = urlParams.get('step');
    const type = urlParams.get('type');
    const query = urlParams.get('query');

    if(query != null){
        const majorSelect = document.getElementsByName("major")[0];
        const gradeSelect = document.getElementsByName("grade")[0];
        const stepSelect = document.getElementsByName("step")[0];
        const typeSelect = document.getElementsByName("type")[0];
        const queryInput = document.getElementsByName("query")[0];

        for (const m of majorSelect.options) {
            if(m.value == major){m.selected = true;}
        }

        for (const g of gradeSelect.options) {
            if(g.value == grade){g.selected = true;}
        }

        for (const s of stepSelect.options) {
            if(s.value == step){s.selected = true;}
        }
        for (const t of typeSelect.options) {
            if(t.value == type){t.selected = true;}
        }

        queryInput.value = query;
    }
}

placeholer();







