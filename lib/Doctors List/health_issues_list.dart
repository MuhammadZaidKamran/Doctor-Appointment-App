import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HealthIssuesModel {
  String? diseaseName;
  AssetImage imageData;
  String? text;
  Color? tileColor;
  bool selected;

  HealthIssuesModel(this.diseaseName , this.imageData , this.text , this.tileColor ,this.selected);

}


List<HealthIssuesModel> healthList = [

    HealthIssuesModel("Heart Attack", const AssetImage("assets/Images/heart.webp"), "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", const Color.fromARGB(42, 244, 85, 85), false),

    HealthIssuesModel("Diabetes", const AssetImage("assets/Images/diabetes.webp"), "Diabetes mellitus, often known simply as diabetes, is a group of common endocrine diseases characterized by sustained high blood sugar levels. Diabetes is due to either the pancreas not producing enough insulin, or the cells of the body becoming unresponsive to the hormone's effects.", const Color.fromARGB(42, 225, 85, 244), false),

    HealthIssuesModel("Malaria", const AssetImage("assets/Images/malaria.webp"), "Malaria is a mosquito-borne infectious disease that affects vertebrates. Human malaria causes symptoms that typically include fever, fatigue, vomiting, and headaches. In severe cases, it can cause jaundice, seizures, coma, or death.", const Color.fromARGB(42, 111, 244, 85), false),

    HealthIssuesModel("Corona Virus", const AssetImage("assets/Images/corona.jpg"), "Coronavirus disease 2019 is a contagious disease caused by the coronavirus SARS-CoV-2. The first known case was identified in Wuhan, China, in December 2019.", const Color.fromARGB(42, 85, 151, 244), false),

    HealthIssuesModel("Diarrhea", const AssetImage("assets/Images/diarrhea.avif"), "Diarrhea, also spelled diarrhoea or diarrhœa, is the condition of having at least three loose, liquid, or watery bowel movements in a day. It often lasts for a few days and can result in dehydration due to fluid loss.", const Color.fromARGB(42, 241, 244, 85), false),

    HealthIssuesModel("Tuberculosis", const AssetImage("assets/Images/tuberculosis.png!sw800"), "Tuberculosis, also known colloquially as the ${"white death"}, or historically as consumption, is an infectious disease usually caused by Mycobacterium tuberculosis bacteria. Tuberculosis generally affects the lungs, but it can also affect other parts of the body.", const Color.fromARGB(42, 244, 167, 85), false),

    HealthIssuesModel("AIDS", const AssetImage("assets/Images/aids.jpg"), "The human immunodeficiency virus is a retrovirus that attacks the immune system. It can be managed with treatment. Without treatment it can lead to a spectrum of conditions including acquired immunodeficiency syndrome.", const Color.fromARGB(42, 85, 244, 204), false),

    HealthIssuesModel("Ebola", const AssetImage("assets/Images/ebola.jpg"), "Ebola, also known as Ebola virus disease and Ebola hemorrhagic fever, is a viral hemorrhagic fever in humans and other primates, caused by ebolaviruses. Symptoms typically start anywhere between two days and three weeks after infection. The first symptoms are usually fever, sore throat, muscle pain, and headaches.", const Color.fromARGB(42, 244, 85, 159), false),

    HealthIssuesModel("Stroke", const AssetImage("assets/Images/stroke.webp"), "Stroke is a medical condition in which poor blood flow to the brain causes cell death. There are two main types of stroke: ischemic, due to lack of blood flow, and hemorrhagic, due to bleeding. Both cause parts of the brain to stop functioning properly.", const Color.fromARGB(42, 88, 85, 244), false),

    HealthIssuesModel("Cholera", const AssetImage("assets/Images/cholera.png"), "Cholera is an infection of the small intestine by some strains of the bacterium Vibrio cholerae. Symptoms may range from none, to mild, to severe. The classic symptom is large amounts of watery diarrhea lasting a few days. Vomiting and muscle cramps may also occur.", const Color.fromARGB(42, 170, 244, 85), false),

    HealthIssuesModel("Smallpox", const AssetImage("assets/Images/smallpox.webp"), "Smallpox was an infectious disease caused by variola virus, which belongs to the genus Orthopoxvirus.", const Color.fromARGB(42, 244, 127, 85), false),

    HealthIssuesModel("Hantavirus", const AssetImage("assets/Images/hanta.jpg"), "Orthohantavirus is a genus of single-stranded, enveloped, negative-sense RNA viruses in the family Hantaviridae within the order Bunyavirales. Members of this genus may be called orthohantaviruses or simply hantaviruses. Orthohantaviruses typically cause chronic asymptomatic infection in rodents.", const Color.fromARGB(42, 225, 244, 85), false),

    HealthIssuesModel("Influenza", const AssetImage("assets/Images/influenza.jpg"), "Influenza, commonly known as ${"the flu"} or just ${"flu"}, is an infectious disease caused by influenza viruses. Symptoms range from mild to severe and often include fever, runny nose, sore throat, muscle pain, headache, coughing, and fatigue.", const Color.fromARGB(42, 76, 104, 245), false),

    HealthIssuesModel("Cancer", const AssetImage("assets/Images/cancer.jpg"), "Cancer is a group of diseases involving abnormal cell growth with the potential to invade or spread to other parts of the body. These contrast with benign tumors, which do not spread.", const Color.fromARGB(42, 232, 41, 249), false),

    HealthIssuesModel("Cirrhosis", const AssetImage("assets/Images/cirrhosis.webp"), "Cirrhosis, also known as liver cirrhosis or hepatic cirrhosis, and end-stage liver disease, is the impaired liver function caused by the formation of scar tissue known as fibrosis due to damage caused by liver disease. Damage to the liver leads to repair of liver tissue and subsequent formation of scar tissue.", const Color.fromARGB(42, 249, 41, 41), false),

    HealthIssuesModel("Lassa fever", const AssetImage("assets/Images/lassa.jpg"), "Lassa fever, also known as Lassa hemorrhagic fever, is a type of viral hemorrhagic fever caused by the Lassa virus. Many of those infected by the virus do not develop symptoms. When symptoms occur they typically include fever, weakness, headaches, vomiting, and muscle pains.", const Color.fromARGB(42, 41, 249, 117), false),

    HealthIssuesModel("Rabies", const AssetImage("assets/Images/rabies.jpg"), "Rabies is a viral disease that causes encephalitis in humans and other mammals. It was historically referred to as hydrophobia due to the symptom of panic when presented with liquids to drink. Early symptoms can include fever and abnormal sensations at the site of exposure.", const Color.fromARGB(42, 253, 173, 13), false),

    HealthIssuesModel("SARS", const AssetImage("assets/Images/sars.jpg"), "Severe acute respiratory syndrome is a viral respiratory disease of zoonotic origin caused by the virus SARS-CoV-1, the first identified strain of the SARS-related coronavirus. The first known cases occurred in November 2002, and the syndrome caused the 2002–2004 SARS outbreak.", const Color.fromARGB(42, 138, 41, 249), false),

    HealthIssuesModel("CVD", const AssetImage("assets/Images/cardiovascular.jpg"), "Cardiovascular disease is any disease involving the heart or blood vessels. CVDs constitute a class of diseases that includes: coronary artery diseases, heart failure, hypertensive heart disease.", const Color.fromARGB(42, 253, 13, 181), false),

    HealthIssuesModel("Lung Disease", const AssetImage("assets/Images/lung.webp"), "Respiratory diseases, or lung diseases, are pathological conditions affecting the organs and tissues that make gas exchange difficult in air-breathing animals.", const Color.fromARGB(42, 41, 218, 249), false),

  ];
