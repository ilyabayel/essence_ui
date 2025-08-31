defmodule Storybook.Components.DialogStory do
  @moduledoc false
  use PhoenixStorybook.Story, :component

  def function, do: &EssenceUI.Components.Dialog.dialog/1

  def imports, do: [{EssenceUI.Components.Button, button: 1}]

  def container,
    do:
      {:div,
       "data-scaling": "100%",
       "data-radius": "medium",
       style: "display: block; padding: 20px;",
       "data-gray-color": "slate",
       "data-accent-color": "indigo"}

  def layout, do: :one_column

  def variations do
    [
      %Variation{
        id: :default,
        template: """
        <.dialog id="dialog">
          Hello, there!
          <.button phx-click={JS.dispatch("close", to: "#dialog")}>
            Close Dialog
          </.button>
        </.dialog>
        <.button phx-click={JS.dispatch("open", to: "#dialog")}>
          Open Dialog
        </.button>
        """
      }
      # %Variation{
      #   id: :open,
      #   attributes: %{
      #     open: true
      #   },
      #   slots: [
      #     """
      #     <:inner_block>
      #       <.dialog_trigger phx-click="show_dialog">Open Dialog</.dialog_trigger>

      #       <.dialog_portal>
      #         <.dialog_overlay phx-click="hide_dialog" />
      #         <.dialog_content>
      #           <.dialog_title>Delete Account</.dialog_title>
      #           <.dialog_description>
      #             Are you sure you want to delete your account? This action cannot be undone.
      #           </.dialog_description>

      #           <div class="flex justify-end gap-2 mt-6">
      #             <.dialog_close phx-click="hide_dialog" class="px-4 py-2 bg-gray-200 rounded-md">
      #               Cancel
      #             </.dialog_close>
      #             <button class="px-4 py-2 bg-red-600 text-white rounded-md">
      #               Delete Account
      #             </button>
      #           </div>
      #         </.dialog_content>
      #       </.dialog_portal>
      #     </:inner_block>
      #     """
      #   ]
      # },
      # %Variation{
      #   id: :custom_styling,
      #   attributes: %{
      #     open: true
      #   },
      #   slots: [
      #     """
      #     <:inner_block>
      #       <.dialog_trigger class="bg-green-600 text-white px-4 py-2 rounded-md" phx-click="show_dialog">
      #         Custom Trigger
      #       </.dialog_trigger>

      #       <.dialog_portal>
      #         <.dialog_overlay
      #           class="bg-black/80"
      #           phx-click="hide_dialog"
      #         />
      #         <.dialog_content class="bg-white p-6 rounded-lg shadow-2xl max-w-md mx-auto">
      #           <.dialog_title class="text-2xl font-bold text-green-600 mb-2">
      #             Custom Styled Dialog
      #           </.dialog_title>
      #           <.dialog_description class="text-gray-600 mb-4">
      #             This dialog demonstrates custom styling capabilities.
      #           </.dialog_description>

      #           <div class="bg-green-50 p-4 rounded-md mb-4">
      #             <p class="text-green-800 text-sm">
      #               ✅ Your changes have been saved successfully!
      #             </p>
      #           </div>

      #           <.dialog_close
      #             phx-click="hide_dialog"
      #             class="w-full bg-green-600 text-white px-4 py-2 rounded-md hover:bg-green-700"
      #           >
      #             Close
      #           </.dialog_close>
      #         </.dialog_content>
      #       </.dialog_portal>
      #     </:inner_block>
      #     """
      #   ]
      # }
    ]
  end
end
