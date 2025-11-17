#import "@preview/touying:0.6.1": *

#let appendix-mode = state("appendix-mode", false)
#let main-slide-count = state("main-slide-count", 0)
#let main-slides-total = state("main-slides-total", 0)

#let slide(title: auto, ..args) = touying-slide-wrapper(
	self => {

	  	let header(self) = {
			set align(top)
			show: components.cell.with(fill: self.colors.primary, inset: 1em)
			set align(horizon)
			set text(fill: self.colors.neutral-lightest, size: 1.1em)
			utils.call-or-display(self, self.store.title)
			linebreak()
			set text(size: 1.5em)
			if title != auto {
			  	utils.call-or-display(self, title)
			} else {
			  	utils.display-current-heading(level: 2)
			}
		}


	  	let footer(self) = {
			set align(bottom)
			show: components.cell.with(fill: self.colors.primary, inset: 1em)
			set align(horizon)
			set text(
				fill: self.colors.neutral-lightest, 
				size: .8em
			)
			utils.call-or-display(self, self.store.footer)
			h(1fr)
		
			context {
				let is-appendix = appendix-mode.get()
				let total = main-slides-total.get()
				  
				if is-appendix {
					// In appendix: show "Appendix" or just hide the counter
					"Appendix"
				} else if total > 0 {
					// In main slides: show current / total
					utils.slide-counter.display() + " / " + str(total)
				} else {
					// Fallback: show current / last slide
					utils.slide-counter.display() + " / " + utils.last-slide-number
				}
			}
  		}
	
	  	self = utils.merge-dicts(self, config-page(header: header, footer: footer,),)
	  	touying-slide(self: self, ..args)
	}
)

#let title-slide(..args) = touying-slide-wrapper(
	self => {
		let info = self.info + args.named()
		let body = {
			set align(center + horizon)
			block(
				fill: self.colors.primary,
				width: 80%,
				inset: (y: 1em),
				radius: 1em,
				text(
					size: 1.5em, 
					fill: self.colors.neutral-lightest, 
					weight: "bold", 
					info.title
				),
			)
			set text(fill: self.colors.neutral-darkest)
			if info.author != none { 
				block(info.author) 
			}
			if info.date != none { 
				block(utils.display-info-date(self))
			}
		}
		touying-slide(self: self, body)
	}
)


#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: self.colors.primary,
      margin: 2.3em,
    ),
  )
  set text(fill: self.colors.neutral-lightest, size: 2em)
  touying-slide(self: self, align(horizon + center, body))
})


#let new-section-slide(self: none, body) = touying-slide-wrapper(
	self => {
		let main-body = {
			set align(center + horizon)
			set text(
				size: 2.3em, 
				fill: self.colors.primary, 
				weight: "bold", 
				style: "italic"
			)
			utils.display-current-heading(level: 1)
		}
		touying-slide(self: self, main-body)
	}
)

#let bamboo-theme(
	aspect-ratio: "16-9",
	title: none,
	footer: none,
	..args,
	body,
) = {
	
	set text(size: 20pt)
	show: touying-slides.with(
		config-page(
			paper: "presentation-" + aspect-ratio,
			margin: (top: 5.2em, bottom: 3em, x: 2em),
		),
		config-common(
			slide-fn: slide,
			new-section-slide-fn: new-section-slide,
		),
		config-methods(alert: utils.alert-with-primary-color),
		config-colors(
			primary: rgb("#5E8B65"),
			neutral-lightest: rgb("#ffffff"),
			neutral-darkest: rgb("#000000"),
		),
		config-store(
			title: title,
			footer: footer,
		),
		..args,
    )
	
	body
}

