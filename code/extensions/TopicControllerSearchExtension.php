<?php
class TopicControllerSearchExtension extends Extension{



	public static $allowed_actions = array('TopicSearchForm', 'topicresults');

	public function TopicSearchForm() {
			
			$searchText =  'Searching under '.$this->owner->getParent()->Title;

			if($this->owner->request && $this->owner->request->getVar('Search')) {
				$searchText = $this->owner->request->getVar('Search');
			}
			$searchField = new TextField('Search', false, '');
			$searchField->setAttribute('placeholder', 'Search for entries under '.$this->owner->getParent()->Title);
			$searchField->addExtraClass('topic-search-form__input');
			$fields = new FieldList(
				$searchField
			);

			$action = FormAction::create('results', _t('SearchForm.GO', 'Go'));
			$action->addExtraClass('topic-search-form__search-button');
			$actions = new FieldList(
				$action //this is the only real change to tell the form to use a different function for the action
			);
			$form = new SearchForm($this->owner, 'TopicSearchForm', $fields, $actions);
			$form->classesToSearch(FulltextSearchable::get_searchable_classes());
			$form->setTemplate('TopicSearchForm');
			return $form;
		}
	/**
	 * Process and render search results.
	 *
	 * @param array $data The raw request data submitted by user
	 * @param SearchForm $form The form instance that was submitted
	 * @param SS_HTTPRequest $request Request generated for this action
	 */
	public function results($data, $form, $request) {

		$results = $form->getResults();

		$resultsFiltered = $results->filter(array('ParentID' => $this->owner->getParent()->ID));

		$data = array(
			'Results' => $resultsFiltered,
			'Query' => DBField::create_field('Text', $form->getSearchQuery()),
			'Title' => _t('SearchForm.SearchResults', 'Search Results')
		);


		return $this->owner->customise($data)->renderWith(array($this->owner->Parent()->ClassName.'_results', 'TopicHolder_results', 'Page'));
	}
}