
import 'package:ivalia_mobile/api/models/view/section.dart';
import 'package:ivalia_mobile/api/models/view/subsection.dart';

class Sections {
  static List<Section> public() {
    return [
      Section(
        title: 'Conoce Ivalia',
        subsections: [
          Subsection(
              title: 'Nuestros Valores',
              content: 'MISIÓN\n\nOfrecer un servicio de la mejor calidad en el área contable, fiscal y financiera, apoyando así a nuestros clientes a su crecimiento mediante la correcta toma de decisiones, satisfaciendo cada una de las necesidades de todos nuestros colaboradores fomentando una armoniosa relación de trabajo. Además nos planteamos ser un equipo de trabajo jóven e innovador siempre a la vanguardia de las nuevas tecnologías que ayudan a tener mayor eficiencia y eficacia en la prestación de nuestros servicios.\n\n\nVISIÓN\n\nSer un despacho contable líder de la región, ofreciendo los servicios con la mejor calidad, profesionalismo y brindando a nuestros clientes su satisfacción mediante servicios de valor agregado.\n\n\nVALORES\n\nCompromiso, Honestidad, Responsabilidad, Respeto y Transparencia.'
          ),
          Subsection(
              title: '¿Quiénes Somos?',
              content: 'Sabemos que su tranquilidad es su mayor activo.\n\nTenemos una trayectoria de más de 13 años de experiencia. Somos una firma jóven e innovadora, con procesos de trabajo confirmados que le aseguran crecimiento a largo plazo y previenen contingencias futuras.\n\nDeje sus problemas en nuestras manos.\n\n¡Somos especialistas!'
          )
        ]
      ),
      Section(
          title: 'Servicios',
          subsections: [
            Subsection(
                title: 'Contabilidad',
                content: 'Nuestro servicio de contabilidades, consta de la realización de las siguientes actividades,las cuales son realizadas de conformidad con las Normas de Información Financiera (NIF) o, en su caso, con las Normas Internacionales de Información Financiera (NIIF):\n\n• Registro en la contabilidad de todos los movimientos cuantificables que afectan a la entidad.\n\n• Realización de conciliaciones bancarias.\n\n• Asociación de documentos xml con las pólizas contables.\n\n• Envío de la contabilidad electrónica al SAT.'
            ),
            Subsection(
                title: 'Asesoría',
                content: 'Como parte de nuestros servicios de asesoría contable y fiscal, se enlistan a continuación nuestras principales actividades, las cuales son llevadas a cabo en base a nuestra experiencia y con el sustento de toda la legislación vigente al momento de su aplicación:\n\n• Revisión de manera selectiva del soporte documental de saldos y operaciones de dicha balanza de comprobación.\n\n• Determinación del pago provisional mensual del Impuesto Sobre la Renta (ISR).\n\n• Determinación del pago definitivo mensual del Impuesto al Valor Agregado (IVA).\n\n• Determinación del resultado fiscal del ejercicio.\n\n• Actualización de indicadores fiscales (CUFIN, CUCA, CUF, Pérdidas fiscales).\n\n• Revisar y apoyar con la presentación de la declaración anual.'
            ),
            Subsection(
                title: 'Auditoría',
                content: '• Auditoria Interna\n\n• Auditoria Externa'
            ),
            Subsection(
                title: 'Servicios Integrados',
                content: 'Adicional a los servicios de asesoría, nuestra firma te apoya con la presentación de los siguientes informes trimestrales, dichos informes tienen la finalidad de apoyarte con la toma de decisiones de la compañía:\n\n• Análisis financiero de la compañía a través de gráficas y otros modelos de análisis e interpretación de la información financiera.\n\n• Proyecciones fiscales.\n\n• Gráficas de las principales razones financieras aplicables al segmento de negocio.'
            ),
            Subsection(
                title: 'Devoluciones',
                content: '¿Qué es la devolución de IVA?\n\nUn contribuyente que a lo largo del periodo (mes, bimestre, trimestre o semestre) paga más Impuesto al Valor Agregado (IVA) del que recibe, puede solicitar su devolución de saldo a favor, mediante las reglas que el Servicio de Administración Tributaria (SAT) señala.\n\nExisten contribuyentes que por el tipo de producto que enajenan (a tasa 0% de IVA) no generan un importe de IVA a cargo, pero si lo están pagando en los gastos y costos de su negocio, y por lo regular cada periodo están generando saldos a favor de IVA, mismos que se les pudieran solicitar vía devolución, como por ejemplo:\n\n• Los agricultores, ganaderos, pesqueros y actividades silvícolas.\n\n• Las empacadoras\n\n• Las agroquímicas, entre otros.'
            ),
            Subsection(
                title: 'Precios de Transferencia',
                content: ''
            ),
            Subsection(
                title: 'Legal y Corporativo',
                content: '• Blindaje patrimonial.\n\n• Gobierno corporativo.\n\n• Constitución de sociedades.\n\n• Transformación, fusión y escisión de sociedades.\n\n• Fideicomisos.\n\n• Contratos mercantiles y laborales.\n\n• Actas de asamblea.'
            )
          ]
      ),
      Section(
          title: 'Aviso De Privacidad',
          content: 'El derecho a la protección de datos personales es una prerrogativa que día a día, adquiere mayor importancia en México.\n\nPor el mal uso de esta información se pueden imponer multas de hasta 27 millones de pesos.\n\nSe estima que en la actualidad el 95% de las empresas incumplen con esta obligación.\n\n¿Tu empresa está blindada en este tema?\n\nContactate con nosotros para mas informacion, a través de nuestro menu contacto.',
          subsections: []
      ),
      Section(
          title: 'Contacto',
          content: 'ZAMORA\n\nTel.: 351 126 0101\nE-mail: contacto@ivalia.com.mx\n\nProl. Suiza 28, La Luneta, 59680, Zamora Michoacán.\n\nTANGANCÍCUARO\n\nTel. 351 180 8064\n\nUruapan 50, Arboledas, 59750, Tangancícuaro Michoacán.\n\nLA PIEDAD\n\nTel. 352 120 08 10\n\nCosmos 17-A, Cd del Sol, 59,310, La Piedad Michoacán.',
          subsections: []
      )
    ];
  }
}